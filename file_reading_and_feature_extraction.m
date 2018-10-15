function [cd,cj,cm]=file_reading_and_feature_extraction()

darya1='darya1.wav';
darya2='darya2.wav';
darya3='darya3.wav';
darya4='darya4.wav';
darya5='darya5.wav';
darya6='darya6.wav';
darya7='darya7.wav';
darya8='darya8.wav';
darya9='darya9.wav';
darya10='darya10.wav';
darya11='darya11.wav';
darya12='darya12.wav';
darya13='darya13.wav';
darya14='darya14.wav';
darya15='darya15.wav';

jangal1='jangal1.wav';
jangal2='jangal2.wav';
jangal3='jangal3.wav';
jangal4='jangal4.wav';
jangal5='jangal5.wav';
jangal6='jangal6.wav';
jangal7='jangal7.wav';
jangal8='jangal8.wav';
jangal9='jangal9.wav';
jangal10='jangal10.wav';
jangal11='jangal11.wav';
jangal12='jangal12.wav';
jangal13='jangal13.wav';
jangal14='jangal14.wav';
jangal15='jangal15.wav';

mordab1='mordab1.wav';
mordab2='mordab2.wav';
mordab3='mordab3.wav';
mordab4='mordab4.wav';
mordab5='mordab5.wav';
mordab6='mordab6.wav';
mordab7='mordab7.wav';
mordab8='mordab8.wav';
mordab9='mordab9.wav';
mordab10='mordab10.wav';
mordab11='mordab11.wav';
mordab12='mordab12.wav';
mordab13='mordab13.wav';
mordab14='mordab14.wav';
mordab15='mordab15.wav';




[cd1]=MFCC(darya1);
[cd2]=MFCC(darya2);
[cd3]=MFCC(darya3);
[cd4]=MFCC(darya4);
[cd5]=MFCC(darya5);
[cd6]=MFCC(darya6);
[cd7]=MFCC(darya7);
[cd8]=MFCC(darya8);
[cd9]=MFCC(darya9);
[cd10]=MFCC(darya10);
[cd11]=MFCC(darya11);
[cd12]=MFCC(darya12);
[cd13]=MFCC(darya13);
[cd14]=MFCC(darya14);
[cd15]=MFCC(darya15);


[cj1]=MFCC(jangal1);
[cj2]=MFCC(jangal2);
[cj3]=MFCC(jangal3);
[cj4]=MFCC(jangal4);
[cj5]=MFCC(jangal5);
[cj6]=MFCC(jangal6);
[cj7]=MFCC(jangal7);
[cj8]=MFCC(jangal8);
[cj9]=MFCC(jangal9);
[cj10]=MFCC(jangal10);
[cj11]=MFCC(jangal11);
[cj12]=MFCC(jangal12);
[cj13]=MFCC(jangal13);
[cj14]=MFCC(jangal14);
[cj15]=MFCC(jangal15);

[cm1]=MFCC(mordab1);
[cm2]=MFCC(mordab2);
[cm3]=MFCC(mordab3);
[cm4]=MFCC(mordab4);
[cm5]=MFCC(mordab5);
[cm6]=MFCC(mordab6);
[cm7]=MFCC(mordab7);
[cm8]=MFCC(mordab8);
[cm9]=MFCC(mordab9);
[cm10]=MFCC(mordab10);
[cm11]=MFCC(mordab11);
[cm12]=MFCC(mordab12);
[cm13]=MFCC(mordab13);
[cm14]=MFCC(mordab14);
[cm15]=MFCC(mordab15);

 

% all the training and testing data will be kept in 3 cells 
cd={cd1 cd2 cd3 cd4 cd5 cd6 cd7 cd8 cd9 cd10 cd11 cd12 cd13 cd14 cd15};
cj={cj1 cj2 cj3 cj4 cj5 cj6 cj7 cj8 cj9 cj10 cj11 cj12 cj13 cj14 cj15};
cm={cm1 cm2 cm3 cm4 cm5 cm6 cm7 cm8 cm9 cm10 cm11 cm12 cm13 cm14 cm15};
