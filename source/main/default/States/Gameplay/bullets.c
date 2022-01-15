#include <gb/gb.h>
#include "States/Gameplay/invaders.h"
#include "States/Gameplay/player.h"
#include "States/Gameplay/bullets.h"
#include "States/GameplayScreen.h"
#include "Common.h"


#define MAX_NUMBER_OF_BULLETS_ON_SCREEN 10

extern unsigned char helper[];

INT8 bullets[MAX_NUMBER_OF_BULLETS_ON_SCREEN];
UINT8 bulletsOnScreen,bulletCounter;

void SetupBullets(){
    
    for(INT8 i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++)bullets[i]=0;
    for(INT8 i=2;i<8;i++)shadow_OAM[i].tile=0;
    bulletCounter=0;
    bulletsOnScreen=0;
}


UINT8 GetAvailableBulletSprite(){

    for(INT8 i=3;i<8;i++){
        if(shadow_OAM[i].tile==0)return i;
    }
    return 0;
}

void SpawnBullet(UINT8 x, UINT8 y,UINT8 isEnemy){

    UINT8 i =GetNextAvailableSprite();
    
    set_sprite_tile(i,42);
    move_sprite(i,x+4,y+12);

    // Use negative values for enemy bullets
    // positive values for plyer bullets
    if(isEnemy)bullets[bulletsOnScreen]=-i;
    else bullets[bulletsOnScreen]=i;

    // Increase how many are on screen
    bulletsOnScreen++;

}

void ReSortBullets(){ 
    
    UINT8 count=0,i=0;
    INT8 sorted[MAX_NUMBER_OF_BULLETS_ON_SCREEN];

    // Create a copy of the bullet array
    for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
        sorted[i]=bullets[i];
    }

    // Put each non-zero value in array again
    for( i=0;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
        if(sorted[i]!=0)bullets[count++]=sorted[i];
    }

    // Set the remaining items as 0
    for( i=count;i<MAX_NUMBER_OF_BULLETS_ON_SCREEN;i++){
        bullets[count++]=0;
    }
}

void RemoveBullet(UINT8 j){
    bulletsOnScreen--;
    INT8 sprite = bullets[j];
    if(sprite<0)sprite=-sprite;
    move_sprite(sprite,160,160);
    set_sprite_tile(sprite,0);
    bullets[j]=0;

    ReSortBullets();
}

void UpdateBullets(){

    for(UINT8 i=2;i<8;i++){
        if(shadow_OAM[i].tile!=0){

            // Move the player bullet up
            // Move enemy bullets down
            if(i==2)shadow_OAM[i].y-=4;
            else shadow_OAM[i].y+=4;

            // If the bullet is off screen,reset it
            if(shadow_OAM[i].y>176||shadow_OAM[i].y>250)shadow_OAM[i].tile=0;

            // If the bullet is onscreen
            else {

                UINT8 c = (shadow_OAM[i].x-4)/8;
                UINT8 r = (shadow_OAM[i].y-12)/8;
                UINT8 crTile=get_bkg_tile_xy(c,r);
                
                if(crTile>=3&&crTile<=17){

                    UINT8 newTile=crTile+1;
                    if(newTile==5)newTile=0;
                    else if(newTile==8)newTile=0;
                    else if(newTile==11)newTile=0;
                    else if(newTile==14)newTile=0;
                    else if(newTile==17)newTile=0;
                    set_bkg_tile_xy(c,r,newTile);
                    shadow_OAM[i].tile=0;
                }

                // If it is an enemy ullet
                if(i>2){
                    if(shadow_OAM[i].x-4<paddle.x-8)continue;
                    if(shadow_OAM[i].x-4>paddle.x+8)continue;
                    if(shadow_OAM[i].y-12<paddle.y-4)continue;
                    if(shadow_OAM[i].y-12>paddle.y+4)continue;
                    shadow_OAM[i].tile=0;
                    paddle.dead=1;
                }
            }


        }
    }
}


void OldUpdateBullets(){

    UINT8 bx,by;

    for(UINT8 j=0;j<MAX_NUMBER_OF_BULLETS_ON_SCREEN;j++){

        if(bullets[j]==0)continue;

        INT8 sprite = bullets[j];
        if(sprite<0)sprite=-sprite;

        if(bullets[j]<0)scroll_sprite(sprite,0,4);
        else scroll_sprite(sprite,0,-4);

        bx = shadow_OAM[sprite].x-4;
        by = shadow_OAM[sprite].y-12;

        // if the bullet is high enough
        // Consider it offscreen
        if(by<8||by>176){

            RemoveBullet(j);

            continue;
        }

        if(bullets[j]<0){

            INT16 xd = paddle.x-bx;
            INT16 yd = paddle.y-by;

            if(xd<0)xd=-xd;
            if(yd<0)yd=-yd;

            if(xd<8&&yd<6){

                RemoveBullet(j);

                paddle.dead=1;

                continue;
            }
        }

        UINT8 bulletColumn = bx/8;
        UINT8 bulletRow=by/8;
            

        get_bkg_tiles(bulletColumn,bulletRow,1,1,helper);

        if(helper[0]>=3&&helper[0]<=17){

            helper[0]=helper[0]+1;
            if(helper[0]==5)helper[0]=0;
            else if(helper[0]==8)helper[0]=0;
            else if(helper[0]==11)helper[0]=0;
            else if(helper[0]==14)helper[0]=0;
            else if(helper[0]==17)helper[0]=0;


            set_bkg_tiles(bulletColumn,bulletRow,1,1,helper);

            RemoveBullet(j);


        } else if(helper[0]>=19&&helper[0]<=23&&bullets[j]>0){

            UINT8 invader= GetInvaderForNode(bulletColumn,bulletRow);

            if(invader!=255){

                if(invaders[invader].active==1){


                    IncreaseScore(10);

                    // Set this enemy as inactive
                    invaders[invader].active=0;
                }

            }
            RemoveBullet(j);

        }

    }
}