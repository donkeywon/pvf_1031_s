sq_RunScript("ui/comborank.nut");
sq_RunScript("ui/cooltime.nut");

function drawNewStyleComboUi(obj) {
    setCharacterComboUiAppendage(obj);
    drawCurrentSkillCoolTimeUI(obj);
    local x = 790;//-50
    local y = 300;//-40
    drawYellowNumber(obj,x,y);
    drawNewStyleComboRate(obj,x,y);
    drawGreatImageEffect(obj,x,y);

    local apd = getComboUiAppendage(obj);
    drawLine(obj,apd.getVar("printID").get_vector(0),x - 30,y,0);
    drawLine(obj,apd.getVar("printID").get_vector(1),x - 30,y + 20,1);
    drawLine(obj,apd.getVar("printID").get_vector(2),x - 30,y + 40,2);
    drawLine(obj,apd.getVar("printID").get_vector(3),x - 30,y + 60,3);
    drawLine(obj,apd.getVar("printID").get_vector(4),x - 30,y + 80,4);
    drawLine(obj,apd.getVar("printID").get_vector(5),x - 30,y + 100,5);
}

function getComboUiAppendage(obj) {
    return obj.GetSquirrelAppendage("ui/ap_ui.nut");
}

function setCharacterComboUiAppendage(obj) {
    if (!CNSquirrelAppendage.sq_IsAppendAppendage(obj, "ui/ap_ui.nut")) {
        local appendage = CNSquirrelAppendage.sq_AppendAppendage(obj, obj, SKILL_RESONANCE, false,
            "ui/ap_ui.nut", true);
    }
}