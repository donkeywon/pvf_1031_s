function drawNewStyleComboRate(obj, x, y) {
    local rank = getNewStyleComboRank(obj, x, y);
}

function drawComboNumber(obj, x, y) {
    local sq_var = obj.getVar();
    local apd = getComboUiAppendage(obj);
    if (apd.getVar("comboNum").get_vector(1) == 1) {
        local combo = apd.getVar("comboNum").get_vector(0);
        local size = apd.getVar("comboNum").get_vector(3);

        local sizeX = (size - 100) / 10;
        local sizeY = (size - 100) / 10;

        if (combo > 99999)
            combo = 99999;

        if (combo >= 0) {
            local yellowNum1 = getComboNumber(obj, combo % 10);
            sq_AnimationProc(yellowNum1);
            yellowNum1.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum1, x - 20 - sizeX, y - sizeY, false);
        }
        if (combo >= 10) {
            local yellowNum2 = getComboNumber(obj, (combo / 10) % 10);
            sq_AnimationProc(yellowNum2);
            yellowNum2.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum2, x - 20 - 10 * size / 100 - sizeX, y - sizeY, false);
        }

        if (combo >= 100) {
            local yellowNum3 = getComboNumber(obj, (combo / 100) % 10);
            sq_AnimationProc(yellowNum3);
            yellowNum3.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum3, x - 20 - 20 * size / 100 - sizeX, y - sizeY, false);
        }

        if (combo >= 1000) {
            local yellowNum4 = getComboNumber(obj, (combo / 1000) % 10);
            sq_AnimationProc(yellowNum4);
            yellowNum4.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum4, x - 20 - 30 * size / 100 - sizeX, y - sizeY, false);
        }

        if (combo >= 10000) {
            local yellowNum5 = getComboNumber(obj, (combo / 10000) % 10);
            sq_AnimationProc(yellowNum5);
            yellowNum5.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum5, x - 20 - 40 * size / 100 - sizeX, y - sizeY, false);
        }

        local comboNumBase = sq_var.GetAnimationMap("comboNumBase", "common/newstylecomboui/combo_num/base.ani");
        sq_AnimationProc(comboNumBase);

        //        x = x - 30;
        //        y = y + 30;


        sq_drawCurrentFrame(base, x - 120, y, false);
    }
}

function drawBackHit(obj, x, y) {
    local sq_var = obj.getVar();
    local numImage = sq_var.GetAnimationMap("comboUIBackHit", "common/newstylecomboui/ui/back.ani");
    sq_AnimationProc(numImage);
    sq_drawCurrentFrame(numImage, x - 120, y, false);

}

function createNewStyleLightEffect(appendage) {

    if (!appendage)
        return false;
    local currT = appendage.getTimer().Get();

    for (local i = 0; i <= 5; i++) {
        local flag = appendage.getVar("lightEffect").get_vector(3 * i);
        if (flag == 1) {
            local t = currT - appendage.getVar("lightEffect").get_vector(3 * i + 2);
            if (t < 250) {
                local size = sq_GetUniformVelocity(100, 0, t, 250);
                appendage.getVar("lightEffect").set_vector(3 * i + 1, size);

            } else {
                appendage.getVar("lightEffect").set_vector(3 * i, 0);
                appendage.getVar("lightEffect").set_vector(3 * i + 1, 0);
                appendage.getVar("lightEffect").set_vector(3 * i + 2, 0);
            }

        }

    }

}

function drawLightEffect(obj, x, y, flag) {
    local size = getComboUiAppendage(obj).getVar("lightEffect").get_vector(3 * flag + 1);
    if (size == 0)
        return;

    local sq_var = obj.getVar();
    local numImage = sq_var.GetAnimationMap("ComboUIlightEffect", "common/newstylecomboui/light_effect.ani");

    sq_AnimationProc(numImage);
    numImage.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);

    sq_drawCurrentFrame(numImage, x + 10, y + 40, false);

}

function drawLine(obj, id, x, y, flag) {
    x += getNewStyleXOffset(obj, flag);
    y += getNewStyleYOffset(obj, flag);
    drawLightEffect(obj, x, y, flag);
    if (id == 1) {
        drawComboNumber(obj, x, y + 30);
    } else if (id == 2) {
        drawFComboNumber(obj, x, y + 30);
    } else if (id == 3) {
        //        drawBackHit(obj,x,y + 30);
    } else if (id == 4) {
        drawBackHit(obj, x, y + 30);
    } else if (id == 5) {
        drawKillRate(obj, x, y + 30);
    }
}

function drawGreatImageEffect(obj, x, y) {
    if (sq_isPVPMode())
        return;

    local apd = getComboUiAppendage(obj);
    if (!apd)
        return false;
    if (apd.getVar("greatEffect").get_vector(0) > 0) {
        local id = apd.getVar("greatEffect").get_vector(1);
        local size = apd.getVar("greatEffect").get_vector(2);
        local ani = getGreatImageAnimation(obj, id);
        ani.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
        sq_AnimationProc(ani);
        sq_drawCurrentFrame(ani, x - 100, y - 25, false);
    }

}

function drawYellowNumber(obj, x, y) {
    if (sq_isPVPMode())
        return false;

    local apd = getComboUiAppendage(obj);
    local combo = apd.getVar("yellowNum").get_vector(0);
    local alpho = apd.getVar("YellowAlpha").get_vector(0);
    local rgb = sq_RGB(255, 255, 255);

    if (combo > 9999999)
        combo = 9999999;

    if (combo >= 0) {
        local yellowNum1 = getYellowNumber(obj, combo % 10);
        sq_AnimationProc(yellowNum1);
        local alpha = sq_ALPHA(alpho);
        sq_drawCurrentFrame(yellowNum1, x - 20, y, false);
    }
    if (combo >= 10) {
        local yellowNum2 = getYellowNumber(obj, (combo / 10) % 10);
        sq_AnimationProc(yellowNum2);

        local alpha = sq_ALPHA(alpho);

        sq_drawCurrentFrame(yellowNum2, x - 20 - 20, y, false);
    }
    if (combo >= 100) {
        local yellowNum3 = getYellowNumber(obj, (combo / 100) % 10);
        sq_AnimationProc(yellowNum3);

        local alpha = sq_ALPHA(alpho);
        sq_drawCurrentFrame(yellowNum3, x - 20 - 40, y, false);

    }
    if (combo >= 1000) {
        local yellowNum4 = getYellowNumber(obj, (combo / 1000) % 10);
        sq_AnimationProc(yellowNum4);

        local alpha = sq_ALPHA(alpho);
        sq_drawCurrentFrame(yellowNum4, x - 20 - 60, y, false);

    }
    if (combo >= 10000) {
        local yellowNum5 = getYellowNumber(obj, (combo / 10000) % 10);
        sq_AnimationProc(yellowNum5);

        local alpha = sq_ALPHA(alpho);
        sq_drawCurrentFrame(yellowNum5, x - 20 - 80, y, false);

    }

    if (combo >= 100000) {
        local yellowNum6 = getYellowNumber(obj, (combo / 100000) % 10);
        sq_AnimationProc(yellowNum6);

        local alpha = sq_ALPHA(alpho);
        sq_drawCurrentFrame(yellowNum6, x - 20 - 100, y, false);

    }

    if (combo >= 1000000) {
        local yellowNum7 = getYellowNumber(obj, (combo / 1000000) % 10);
        sq_AnimationProc(yellowNum7);

        local alpha = sq_ALPHA(alpho);
        sq_drawCurrentFrame(yellowNum7, x - 20 - 120, y, false);

    }

}

function drawFComboNumber(obj, x, y) {
    local sq_var = obj.getVar();
    local apd = getComboUiAppendage(obj);
    if (apd.getVar("comboNum").get_vector(1) == 1) {
        local fcombo = apd.getVar("FcomboNum").get_vector(0);

        local size = apd.getVar("FcomboNum").get_vector(3);

        local sizeX = (size - 100) / 10;
        local sizeY = (size - 100) / 10;

        if (fcombo > 99999)
            fcombo = 99999;

        if (fcombo >= 0) {
            local yellowNum1 = getFComboNumber(obj, fcombo % 10);
            sq_AnimationProc(yellowNum1);
            yellowNum1.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum1, x - 30 - sizeX, y - sizeY, false);
        }
        if (fcombo >= 10) {
            local yellowNum2 = getFComboNumber(obj, (fcombo / 10) % 10);
            sq_AnimationProc(yellowNum2);
            yellowNum2.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum2, x - 30 - 10 * size / 100 - sizeX, y - sizeY, false);
        }

        if (fcombo >= 100) {
            local yellowNum3 = getFComboNumber(obj, (fcombo / 100) % 10);
            sq_AnimationProc(yellowNum3);
            yellowNum3.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum3, x - 30 - 20 * size / 100 - sizeX, y - sizeY, false);
        }
        if (fcombo >= 1000) {
            local yellowNum4 = getFComboNumber(obj, (fcombo / 1000) % 10);
            sq_AnimationProc(yellowNum4);
            yellowNum4.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum4, x - 30 - 30 * size / 100 - sizeX, y - sizeY, false);
        }
        if (fcombo >= 10000) {
            local yellowNum5 = getFComboNumber(obj, (fcombo / 10000) % 10);
            sq_AnimationProc(yellowNum5);
            yellowNum5.setImageRate(size.tofloat() / 100.0, size.tofloat() / 100.0);
            sq_drawCurrentFrame(yellowNum5, x - 30 - 40 * size / 100 - sizeX, y - sizeY, false);
        }

        local FcomboNumBase = sq_var.GetAnimationMap("FcomboNumBase", "common/newstylecomboui/combo_num/f_base.ani");
        sq_AnimationProc(FcomboNumBase);
        sq_drawCurrentFrame(FcomboNumBase, x - 120, y, false);
    }
}

function drawKillRate(obj, x, y) {

    local apd = getComboUiAppendage(obj);
    if (apd.getVar("killRateFlag").get_vector(0) == 1) {
        local num = apd.getVar("killRateFlag").get_vector(1);
        drawKillRateNumber(obj, x - 25, y - 5, num);
        local sq_var = obj.getVar();
        local numImage = sq_var.GetAnimationMap("killRateBack", "common/newstylecomboui/killrate/basic.ani");
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x + 10, y + 5, false);
    }

}

function getGreatImageAnimation(obj, id) {
    local sq_var = obj.getVar();

    local ani = sq_var.GetAnimationMap("greatImageAnimation1", "common/newstylecomboui/great/1.ani");
    if (id == 2)
        ani = sq_var.GetAnimationMap("greatImageAnimation2", "common/newstylecomboui/great/2.ani");
    else if (id == 3)
        ani = sq_var.GetAnimationMap("greatImageAnimation3", "common/newstylecomboui/great/3.ani");
    else if (id == 4)
        ani = sq_var.GetAnimationMap("greatImageAnimation4", "common/newstylecomboui/great/4.ani");
    else if (id == 5)
        ani = sq_var.GetAnimationMap("greatImageAnimation5", "common/newstylecomboui/great/5.ani");
    return ani;
}

function drawKillRateNumber(obj, x, y,
    var) {
    local sub = -10;
    y = y + 2;

    if (var > 9999999)
        var = 9999999;

    if (var >= 0) {
        local numImage = getKillRateNumber(obj,
            var % 10);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x + 0, y, false);
    }
    if (var >= 10) {
        local numImage = getKillRateNumber(obj,
            var / 10);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 10, y, false);
        sub = -20;
    }
    if (var >= 100) {
        local numImage = getKillRateNumber(obj,
            var / 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 20, y, false);
        sub = -30;
    }
    if (var >= 1000) {
        local numImage = getKillRateNumber(obj,
            var / 1000);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 30, y, false);
        sub = -40;
    }
    if (var >= 10000) {
        local numImage = getKillRateNumber(obj,
            var / 10000);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 40, y, false);
        sub = -50;
    }
    if (var >= 100000) {
        local numImage = getKillRateNumber(obj,
            var / 100000);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y, false);
        sub = -60;
    }
    if (var >= 1000000) {
        local numImage = getKillRateNumber(obj,
            var / 1000000);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 60, y, false);
        sub = -70;
    }

    local numImage = obj.getVar().GetAnimationMap("killRateAdd", "common/newstylecomboui/killrate/add.ani");
    sq_AnimationProc(numImage);
    sq_drawCurrentFrame(numImage, x + sub - 5, y, false);
}

function getKillRateNumber(obj, num) {
    local numImage = null;
    local sq_var = obj.getVar();
    num = num % 10;
    if (num == 0) {
        numImage = sq_var.GetAnimationMap("kynum0", "common/newstylecomboui/killrate/0.ani");
    } else if (num == 1) {
        numImage = sq_var.GetAnimationMap("kynum1", "common/newstylecomboui/killrate/1.ani");
    } else if (num == 2) {
        numImage = sq_var.GetAnimationMap("kynum2", "common/newstylecomboui/killrate/2.ani");
    } else if (num == 3) {
        numImage = sq_var.GetAnimationMap("kynum3", "common/newstylecomboui/killrate/3.ani");
    } else if (num == 4) {
        numImage = sq_var.GetAnimationMap("kynum4", "common/newstylecomboui/killrate/4.ani");
    } else if (num == 5) {
        numImage = sq_var.GetAnimationMap("kynum5", "common/newstylecomboui/killrate/5.ani");
    } else if (num == 6) {
        numImage = sq_var.GetAnimationMap("kynum6", "common/newstylecomboui/killrate/6.ani");
    } else if (num == 7) {
        numImage = sq_var.GetAnimationMap("kynum7", "common/newstylecomboui/killrate/7.ani");
    } else if (num == 8) {
        numImage = sq_var.GetAnimationMap("kynum8", "common/newstylecomboui/killrate/8.ani");
    } else if (num == 9) {
        numImage = sq_var.GetAnimationMap("kynum9", "common/newstylecomboui/killrate/9.ani");
    }
    return numImage;
}

function setKillPowerTimeEvent(appendage) {

    if (!appendage) {
        return;
    }

    local currT = appendage.getTimer().Get();


    if (appendage.getVar("killRateFlag").get_vector(0) == 1) {
        local t = currT - appendage.getVar("killRateFlag").get_vector(2);
        if (t >= 2000) {
            local lastRate = appendage.getVar("yellowNum").get_vector(0);
            appendage.getVar("yellowNum").set_vector(0,
                lastRate + appendage.getVar("killRateFlag").get_vector(1));

            createGreatWithAudioEffect(appendage, appendage.getVar("killRateFlag").get_vector(1));

            deleteNumber(appendage, 5);
            appendage.getVar("killRateFlag").clear_vector();
            appendage.getVar("killRateFlag").push_vector(0);
            appendage.getVar("killRateFlag").push_vector(0);
            appendage.getVar("killRateFlag").push_vector(0);
        } else {

        }
    }

}

function createGreatWithAudioEffect(appendage, killPower) {


    if (sq_isPVPMode())
        return;

    if (!appendage) {
        return;
    }

    local parentObj = appendage.getParent();
    local obj = sq_GetCNRDObjectToSQRCharacter(parentObj);

    local currT = appendage.getTimer().Get();

    appendage.getVar("greatEffect").set_vector(0, currT);

    if (killPower <= 1000) {
        appendage.getVar("greatEffect").set_vector(1, 1);
        obj.sq_PlaySound("HK3_GOOD");
    } else if (killPower <= 2000) {
        appendage.getVar("greatEffect").set_vector(1, 2);
        obj.sq_PlaySound("HK3_GREAT");
    } else if (killPower <= 8000) {
        appendage.getVar("greatEffect").set_vector(1, 3);
        obj.sq_PlaySound("HK3_NICE");
    } else if (killPower <= 10000) {
        appendage.getVar("greatEffect").set_vector(1, 4);
        obj.sq_PlaySound("HK3_PERFECT");
    } else {
        appendage.getVar("greatEffect").set_vector(1, 5);
        obj.sq_PlaySound("HK3_OKILL");
    }
    appendage.getVar("greatEffect").set_vector(2, 100);
}

function deleteNumber(appendage, num) {
    local k = 0;

    for (local i = 0; i <= 4; i++) {
        if (appendage.getVar("printID").get_vector(i) == num && k == 0) {
            appendage.getVar("printID").set_vector(i, 0);
            k = i + 1;
            return true;
        }
    }

}

function getFComboNumber(obj, num) {
    local numImage = null;
    local sq_var = obj.getVar();
    if (num == 0) {
        numImage = sq_var.GetAnimationMap("Fcynum0", "common/newstylecomboui/combo_num/0.ani");
    } else if (num == 1) {
        numImage = sq_var.GetAnimationMap("Fcynum1", "common/newstylecomboui/combo_num/1.ani");
    } else if (num == 2) {
        numImage = sq_var.GetAnimationMap("Fcynum2", "common/newstylecomboui/combo_num/2.ani");
    } else if (num == 3) {
        numImage = sq_var.GetAnimationMap("Fcynum3", "common/newstylecomboui/combo_num/3.ani");
    } else if (num == 4) {
        numImage = sq_var.GetAnimationMap("Fcynum4", "common/newstylecomboui/combo_num/4.ani");
    } else if (num == 5) {
        numImage = sq_var.GetAnimationMap("Fcynum5", "common/newstylecomboui/combo_num/5.ani");
    } else if (num == 6) {
        numImage = sq_var.GetAnimationMap("Fcynum6", "common/newstylecomboui/combo_num/6.ani");
    } else if (num == 7) {
        numImage = sq_var.GetAnimationMap("Fcynum7", "common/newstylecomboui/combo_num/7.ani");
    } else if (num == 8) {
        numImage = sq_var.GetAnimationMap("Fcynum8", "common/newstylecomboui/combo_num/8.ani");
    } else {
        numImage = sq_var.GetAnimationMap("Fcynum9", "common/newstylecomboui/combo_num/9.ani");
    }

    return numImage;
}

function getNewStyleComboRank(obj, x, y) {
    if (sq_isPVPMode()) return;
    local sq_var = obj.getVar();
    local flag = 0;
    local apd = getComboUiAppendage(obj);
    local combo = apd.getVar("yellowNum").get_vector(0);
    local size = apd.getVar("scoreSize").get_vector(1);
    local numImage = null;
    if (checkUpNewStyleUINone(obj))
        flag = 1;

    if (combo <= 2500) {
        numImage = sq_var.GetAnimationMap("newStyleCombo_F" + flag, "common/newstylecomboui/rank/f.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        drawNewStyleComboRankFinalEffect(obj, 0, (combo * 100) / 2500);
    } else if (combo <= 10000) {
        numImage = sq_var.GetAnimationMap("newStyleCombo_D" + flag, "common/newstylecomboui/rank/e.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        setNewStyleRankFlag(obj, 0);
        drawNewStyleComboRankFinalEffect(obj, 1, ((combo - 2500) * 100) / 7500);
    } else if (combo <= 30000) {
        numImage = sq_var.GetAnimationMap("newStyleCombo_C" + flag, "common/newstylecomboui/rank/c.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        setNewStyleRankFlag(obj, 1);
        drawNewStyleComboRankFinalEffect(obj, 2, ((combo - 10000) * 100) / 20000);
    } else if (combo <= 70000) {
        numImage = sq_var.GetAnimationMap("newStyleCombo_B" + flag, "common/newstylecomboui/rank/b.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        setNewStyleRankFlag(obj, 2);
        drawNewStyleComboRankFinalEffect(obj, 3, ((combo - 30000) * 100) / 40000);
    } else if (combo <= 150000) {
        numImage = sq_var.GetAnimationMap("newStyleCombo_A" + flag, "common/newstylecomboui/rank/a.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        setNewStyleRankFlag(obj, 3);
        drawNewStyleComboRankFinalEffect(obj, 4, ((combo - 70000) * 100) / 60000);
    } else if (combo <= 450000) {
        numImage = sq_var.GetAnimationMap("newStyleCombo_S" + flag, "common/newstylecomboui/rank/s.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        setNewStyleRankFlag(obj, 4);
        drawNewStyleComboRankFinalEffect(obj, 5, ((combo - 150000) * 100) / 300000);
    } else if (combo <= 1000000) {
        numImage = sq_var.GetAnimationMap("newStyleCombo_SS" + flag, "common/newstylecomboui/rank/ss.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        setNewStyleRankFlag(obj, 5);
        drawNewStyleComboRankFinalEffect(obj, 6, ((combo - 450000) * 100) / 550000);
    } else {
        numImage = sq_var.GetAnimationMap("newStyleCombo_SSS" + flag,
            "common/newstylecomboui/rank/sss.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x - 50, y - 40, false);
        setNewStyleRankFlag(obj, 6);
        drawNewStyleComboRankFinalEffect(obj, 7, 100);
    }
    return numImage;
}

function checkUpNewStyleUINone(obj) {
    local apd = getComboUiAppendage(obj);
    if (apd.getVar("printID").get_vector(0) == 0 &&
        apd.getVar("printID").get_vector(1) == 0 &&
        apd.getVar("printID").get_vector(2) == 0 &&
        apd.getVar("printID").get_vector(3) == 0 &&
        apd.getVar("printID").get_vector(4) == 0 &&
        apd.getVar("printID").get_vector(5) == 0)
        return true;
    return false;
}

function drawNewStyleComboRankFinalEffect(obj, level,
    var) {
    if (sq_isPVPMode()) return;
    local sq_var = obj.getVar();
    local numImage = null;
    local x = 740;
    local y = 260;

    local flag = 0;

    setClip(739, 262 + (20.0 * ((100 -
        var).tofloat() / 100.0)).tointeger(), 789, 282);

    if (checkUpNewStyleUINone(obj))
        flag = 1;

    if (level == 0) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_F" + flag,
            "common/newstylecomboui/rank/f_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    } else if (level == 1) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_E" + flag,
            "common/newstylecomboui/rank/e_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    } else if (level == 2) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_C" + flag,
            "common/newstylecomboui/rank/c_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    } else if (level == 3) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_B" + flag,
            "common/newstylecomboui/rank/b_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    } else if (level == 4) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_A" + flag,
            "common/newstylecomboui/rank/a_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    } else if (level == 5) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_S" + flag,
            "common/newstylecomboui/rank/s_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    } else if (level == 6) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_SS" + flag,
            "common/newstylecomboui/rank/ss_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    } else if (level == 7) {
        numImage = sq_var.GetAnimationMap("newStyleComboFinal_SSS" + flag,
            "common/newstylecomboui/rank/sss_1.ani");
        if (checkUpNewStyleUINone(obj))
            numImage.setRGBA(255, 255, 255, 100);
        sq_AnimationProc(numImage);
        sq_drawCurrentFrame(numImage, x, y, false);
    }

    releaseClip();
}

function setNewStyleRankFlag(obj, flag) {
    local apd = getComboUiAppendage(obj);
    if (apd.getVar("numFlag").get_vector(flag) == 0) {
        apd.getVar("numFlag").set_vector(flag, 1);
        apd.getVar("scoreSize").set_vector(0, 1);
        apd.getVar("scoreSize").set_vector(1, 100);
        apd.getVar("scoreSize").set_vector(2, apd.getTimer().Get());
    }
}

function setComboUIRate(appendage, damager) {
    local combo = appendage.getVar("comboNum").get_vector(0);
    local fcombo = appendage.getVar("FcomboNum").get_vector(0);

    local lastRate = appendage.getVar("yellowNum").get_vector(0);

    if (combo < 20)
        lastRate += 10;
    else if (combo < 50)
        lastRate += 12;
    else if (combo < 150)
        lastRate += 15;
    else if (combo < 500)
        lastRate += 20;
    else
        lastRate += 25;


    if (fcombo < 5)
        lastRate += 15;
    else if (fcombo < 10)
        lastRate += 17;
    else if (fcombo < 20)
        lastRate += 28;
    else if (fcombo < 30)
        lastRate += 30;
    else
        lastRate += 36;

    return lastRate;

}

function getYellowNumber(obj, num) {
    local numImage = null;
    local sq_var = obj.getVar();
    if (!checkUpNewStyleUINone(obj)) {
        if (num == 0) {
            numImage = sq_var.GetAnimationMap("ynum0", "common/newstylecomboui/yellow_num/0.ani");
        } else if (num == 1) {
            numImage = sq_var.GetAnimationMap("ynum1", "common/newstylecomboui/yellow_num/1.ani");
        } else if (num == 2) {
            numImage = sq_var.GetAnimationMap("ynum2", "common/newstylecomboui/yellow_num/2.ani");
        } else if (num == 3) {
            numImage = sq_var.GetAnimationMap("ynum3", "common/newstylecomboui/yellow_num/3.ani");
        } else if (num == 4) {
            numImage = sq_var.GetAnimationMap("ynum4", "common/newstylecomboui/yellow_num/4.ani");
        } else if (num == 5) {
            numImage = sq_var.GetAnimationMap("ynum5", "common/newstylecomboui/yellow_num/5.ani");
        } else if (num == 6) {
            numImage = sq_var.GetAnimationMap("ynum6", "common/newstylecomboui/yellow_num/6.ani");
        } else if (num == 7) {
            numImage = sq_var.GetAnimationMap("ynum7", "common/newstylecomboui/yellow_num/7.ani");
        } else if (num == 8) {
            numImage = sq_var.GetAnimationMap("ynum8", "common/newstylecomboui/yellow_num/8.ani");
        } else {
            numImage = sq_var.GetAnimationMap("ynum9", "common/newstylecomboui/yellow_num/9.ani");
        }
    } else {
        if (num == 0) {
            numImage = sq_var.GetAnimationMap("ynum02", "common/newstylecomboui/yellow_num/0.ani");
        } else if (num == 1) {
            numImage = sq_var.GetAnimationMap("ynum12", "common/newstylecomboui/yellow_num/1.ani");
        } else if (num == 2) {
            numImage = sq_var.GetAnimationMap("ynum22", "common/newstylecomboui/yellow_num/2.ani");
        } else if (num == 3) {
            numImage = sq_var.GetAnimationMap("ynum32", "common/newstylecomboui/yellow_num/3.ani");
        } else if (num == 4) {
            numImage = sq_var.GetAnimationMap("ynum42", "common/newstylecomboui/yellow_num/4.ani");
        } else if (num == 5) {
            numImage = sq_var.GetAnimationMap("ynum52", "common/newstylecomboui/yellow_num/5.ani");
        } else if (num == 6) {
            numImage = sq_var.GetAnimationMap("ynum62", "common/newstylecomboui/yellow_num/6.ani");
        } else if (num == 7) {
            numImage = sq_var.GetAnimationMap("ynum72", "common/newstylecomboui/yellow_num/7.ani");
        } else if (num == 8) {
            numImage = sq_var.GetAnimationMap("ynum82", "common/newstylecomboui/yellow_num/8.ani");
        } else {
            numImage = sq_var.GetAnimationMap("ynum92", "common/newstylecomboui/yellow_num/9.ani");
        }
        numImage.setRGBA(255, 255, 255, 100);
    }
    return numImage;
}

function getNewStyleXOffset(obj, i) {
    local appendage = getComboUiAppendage(obj);
    local curT = appendage.getTimer().Get();
    local curLineTime = curT - appendage.getVar("lightEffect").get_vector(3 * i + 2);
    if (curLineTime < 100) {
        local lineX = sq_GetAccel(50, 0, curLineTime, 100, true);
        return lineX;
    }
    return 0;
}

function getNewStyleYOffset(obj, i) {
    local appendage = getComboUiAppendage(obj);
    local id = appendage.getVar("printID").get_vector(i);

    if (id == 5) {
        local curT = appendage.getTimer().Get();
        local curLineTime = curT - appendage.getVar("killRateFlag").get_vector(2);
        if (curLineTime <= 1800) {
            return 0;
        } else if (curLineTime <= 2000) {
            local lineY = sq_GetAccel(0, -10, curLineTime - 1800, 200, true);
            return lineY;
        } else {
            return -10;
        }
    } else if (id == 1) {
        local curT = appendage.getTimer().Get();
        local currFinalyT = curT - appendage.getVar("comboNum").get_vector(2);
        if (currFinalyT <= 600) {
            return 0;
        } else if (currFinalyT <= 800) {
            local lineY = sq_GetAccel(0, -10, currFinalyT - 600, 200, true);
            return lineY;
        } else {
            return -10;
        }
    } else if (id == 2) {
        local curT = appendage.getTimer().Get();
        local currFinalyT = curT - appendage.getVar("FcomboNum").get_vector(2);
        if (currFinalyT <= 600) {
            return 0;
        } else if (currFinalyT <= 800) {
            local lineY = sq_GetAccel(0, -10, currFinalyT - 600, 200, true);
            return lineY;
        } else {
            return -10;
        }
    }
    return 0;
}

function setGreatRankTimeEvent(appendage) {
    if (!appendage) {
        return;
    }


    if (sq_isPVPMode())
        return;

    local currT = appendage.getTimer().Get();
    local greaT = appendage.getVar("greatEffect").get_vector(0);
    if (greaT > 0) {
        local currentT = currT - greaT;
        if (currentT <= 1500) {
            if (currentT <= 200) {
                local size = sq_GetAccel(200, 100, currentT, 200, true);
                appendage.getVar("greatEffect").set_vector(2, size);
            } else {
                appendage.getVar("greatEffect").set_vector(2, 100);
            }
        } else {
            appendage.getVar("greatEffect").set_vector(0, 0);
            appendage.getVar("greatEffect").set_vector(1, 0);
            appendage.getVar("greatEffect").set_vector(2, 0);
        }
    }
}

function getComboNum(appendage) {
    return appendage.getVar("comboNum").get_vector(0);
}

function setCharacterComboEffect(appendage) {
    if (!appendage)
        return false;

    local currT = appendage.getTimer().Get();
    appendage.getVar("comboNum").set_vector(0, getComboNum(appendage) + 1);

    if (appendage.getVar("comboNum").get_vector(1) == 0) {

        if (appendage.getVar("comboNum").get_vector(0) >= 2) {
            appendage.getVar("comboNum").set_vector(1, 1);
            appendage.getVar("comboNum").set_vector(2, currT);
            appendage.getVar("comboNum").set_vector(3, 200);
            if (isComboUINumber(appendage, 1))
                printIDAddNumber(appendage, 1);
        }


    } else if (appendage.getVar("comboNum").get_vector(1) == 1) {
        appendage.getVar("comboNum").set_vector(2, currT);
    }

}

function isComboUINumber(appendage, num) {
    for (local i = 0; i <= 4; i++) {
        if (appendage.getVar("printID").get_vector(i) == num) {
            return false;
        }
    }
    return true;
}

function printIDAddNumber(appendage, num) {

    for (local i = 0; i <= 4; i++) {
        if (appendage.getVar("printID").get_vector(i) == 0 ||
            appendage.getVar("printID").get_vector(i) == num) {
            appendage.getVar("printID").set_vector(i, num);
            appendage.getVar("lightEffect").set_vector(i * 3, 1);
            appendage.getVar("lightEffect").set_vector(i * 3 + 2, appendage.getTimer().Get());
            return true;

        }
    }
    return false;

}

function setCharacterSkyComboEffect(appendage, damager) {
    if (!appendage || !damager)
        return false;
    local currT = appendage.getTimer().Get();

    if (damager.getZPos() > 0) {
        appendage.getVar("FcomboNum").set_vector(0, appendage.getVar("FcomboNum").get_vector(0) + 1);
        if (appendage.getVar("FcomboNum").get_vector(1) == 0) {
            appendage.getVar("FcomboNum").set_vector(1, 1);
            appendage.getVar("FcomboNum").set_vector(2, currT);
            if (isComboUINumber(appendage, 2))
                printIDAddNumber(appendage, 2);
        } else if (appendage.getVar("FcomboNum").get_vector(1) == 1) {
            appendage.getVar("FcomboNum").set_vector(2, currT);
        }

    }

}

function isEnemyBack(realAttacker, damager) {
    if (realAttacker.getDirection() == damager.getDirection())
        return true;
    return false;
}

function checkUpCharacterBackHit(appendage, realAttacker, damager) {

    if (!appendage || !damager)
        return false;

    if (isEnemyBack(realAttacker, damager)) {

        printIDAddNumber(appendage, 4);
        local lastRate = appendage.getVar("yellowNum").get_vector(0);
        appendage.getVar("yellowNum").set_vector(0, lastRate + 250);
    }

}