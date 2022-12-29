

sq_RunScript("dnf_enum_header.nut");
sq_RunScript("common.nut"); //



// ĳ���� ��ų state
sq_RunScript("Character/avenger_load_state.nut"); // ������Ʈ - ��� ���� nut���� �ε�
sq_RunScript("Character/atmage_load_state.nut"); // ������ ���� nut���� �ε�
sq_RunScript("Character/CreatorMage_load_state.nut"); // ������ ���� nut���� �ε�
//sq_RunScript("character/drawmaincustomui.nut"); // ���� ��� ���� nut���� �ҷ�����
//sq_RunScript("Character/common_load_state.nut"); // ���뽺ų nut���� �ε�

sq_RunScript("Character/buff_neo.nut");

dofile("SoundPacks/dnftrain/summer_monster.nut"); // 장청 nut 수련장
dofile("SoundPacks/dnftrain/changqing_trainroom1.c"); // 장청 nut 수련장
dofile("SoundPacks/dnftrain/changqing_trainroom2.c"); // 장청 nut 수련장
dofile("SoundPacks/dnftrain/changqing_trainroom3.c"); // 장청 nut 수련장
dofile("chang_qing_nuts/main_monsterstats.nut"); // 몬스터 nut 상태

sq_RunScript("ui/main.nut");

sq_RunScript("character/common/shoucuo.nut");
sq_RunScript("character/common/damagerate.nut");

sq_RunScript("arrangement/arrangement.nut");

