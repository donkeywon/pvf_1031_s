
//啮磐啮确啮谊卖狗啮璀啮踝萧nut啮猪能为啮踝萧啮缓啮踝萧啮竖。啮线啮磋啮踝萧啮缓啮璀啮缘啮羯啮竖要啮诸加啮谅可啮疮啮缄系啮踝萧
//啮瑾啮谅：啮瘠啮缘60 QQ506807329   啮踝萧啮缇NUT啮编啮缇啮篇啮猪荔萧 啮踝萧啮踝萧郋啮?500啮瑾啮踝萧C啮缘啮羯1000啮褒费啮踝萧础啮踝萧j啮踝萧啮璀啮窑啮谆修改萧 啮课如啮瘦啮踝萧啮踝萧啮?啮稽啮踝萧 啮踝萧啮诿品 啮谊喉萧 啮复伐萧 啮踝萧啮踝萧 NPC NPK 啮褒迎萧 啮范啮踝萧 act obj  UI啮请程啮踝萧啮踝萧啮踝萧啮璀啮踝萧啮骂啮箠啮疮啮踝萧啮缇啮瘠

 
 
function onEndCurrentAni_po_qq506807329new_fighter_24373(EDE4CvsO7QuyHl)
{
 if(!EDE4CvsO7QuyHl) return;
 sq_IntVectorClear(sq_GetGlobalIntVector()); 
 local P1WGJ7m_Cgg = EDE4CvsO7QuyHl.getVar("skill").get_vector(0);
 switch(P1WGJ7m_Cgg)
 {
 case 225: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 local iyAPkgEvly = EDE4CvsO7QuyHl.getVar("subType").get_vector(0); 
 if(iyAPkgEvly == 1)
 {
 if(EDE4CvsO7QuyHl.getVar("state").get_vector(0) == 11)
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 }
 else if(iyAPkgEvly == 2)
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 226: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 local iyAPkgEvly = EDE4CvsO7QuyHl.getVar("subType").get_vector(0); 
 if(iyAPkgEvly == 1 && EDE4CvsO7QuyHl.getVar("state").get_vector(0) == 11)
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 else if(iyAPkgEvly == 2)
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 227: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 local QezfLJKeBTjilte8j = EDE4CvsO7QuyHl.getParent(); 
 if(QezfLJKeBTjilte8j && QezfLJKeBTjilte8j.getState() == 227)
 QezfLJKeBTjilte8j.sendStateOnlyPacket(STATE_STAND); 
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 228: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 229: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 230: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 231: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 232: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 233: 
 local iyAPkgEvly = EDE4CvsO7QuyHl.getVar("subType").get_vector(0); 
 switch(iyAPkgEvly)
 {
 case 1: 
 EDE4CvsO7QuyHl.setCurrentAnimation(null); 
 break;
 case 2:
 case 3:
 case 4: 
 if(EDE4CvsO7QuyHl.isMyControlObject())
 {
 if(EDE4CvsO7QuyHl.getVar("state").get_vector(0) == 10)
 EDE4CvsO7QuyHl.addSetStatePacket(11, sq_GetGlobalIntVector(), STATE_PRIORITY_AUTO, false, ""); 
 else
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 }
 break;
 }
 break;
 case 234: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 237: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 local EoeR7u_bT8x4nqVsMnNRj = EDE4CvsO7QuyHl.getVar("state").get_vector(0); 
 if(EoeR7u_bT8x4nqVsMnNRj == 10)
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 238: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 case 239: 
 if(!EDE4CvsO7QuyHl.isMyControlObject())return;
 sq_SendDestroyPacketPassiveObject(EDE4CvsO7QuyHl); 
 break;
 }
} ;
   