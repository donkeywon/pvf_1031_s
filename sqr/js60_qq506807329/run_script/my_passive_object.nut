
//啮磐啮确啮谊卖狗啮璀啮踝萧nut啮猪能为啮踝萧啮缓啮踝萧啮竖。啮线啮磋啮踝萧啮缓啮璀啮缘啮羯啮竖要啮诸加啮谅可啮疮啮缄系啮踝萧
//啮瑾啮谅：啮瘠啮缘60 QQ506807329   啮踝萧啮缇NUT啮编啮缇啮篇啮猪荔萧 啮踝萧啮踝萧郋啮?500啮瑾啮踝萧C啮缘啮羯1000啮褒费啮踝萧础啮踝萧j啮踝萧啮璀啮窑啮谆修改萧 啮课如啮瘦啮踝萧啮踝萧啮?啮稽啮踝萧 啮踝萧啮诿品 啮谊喉萧 啮复伐萧 啮踝萧啮踝萧 NPC NPK 啮褒迎萧 啮范啮踝萧 act obj  UI啮请程啮踝萧啮踝萧啮踝萧啮璀啮踝萧啮骂啮箠啮疮啮踝萧啮缇啮瘠

 
function onGetMyPassiveObject_My(EeWumyYgwX7thHML,MwJO908aJSmC7,UVCEFhtVvmi7dR, EFtUKWEJOg)
{
 local bBPc5x4Ecpcrw = EeWumyYgwX7thHML.getMyPassiveObjectCount(MwJO908aJSmC7); 
 for (local q2Yuk1TcpoNatuI05 = 0; q2Yuk1TcpoNatuI05 < bBPc5x4Ecpcrw; q2Yuk1TcpoNatuI05++)
 {
 local sQBoe1xG3S9I = EeWumyYgwX7thHML.getMyPassiveObject(MwJO908aJSmC7, q2Yuk1TcpoNatuI05); 
 if(!sQBoe1xG3S9I) continue; 
 if (sQBoe1xG3S9I.getVar("skill").get_vector(0) == UVCEFhtVvmi7dR)
 {
 if (EFtUKWEJOg)
 {
 if(EFtUKWEJOg == sQBoe1xG3S9I.getVar("subType").get_vector(0))
 return sQBoe1xG3S9I;
 }
 else
 return sQBoe1xG3S9I;
 }
 }
 return null;
} ;
   