function sq_AddFunctionName(appendage) {
    appendage.sq_AddFunctionName("proc", "proc_appendage_monsterdraw")
    appendage.sq_AddFunctionName("onStart", "onStart_appendage_monsterdraw")
    appendage.sq_AddFunctionName("onAttackParent", "onAttackParent_appendage_monsterdraw")
}

function proc_appendage_monsterdraw(appendage) {
    if (!appendage) {
        return;
    }

    appendage_monsterdraw1(appendage);
}


function onAttackParent_appendage_monsterdraw(appendage, realAttacker, damagerHP, boundingBox, isStuck) {
    if (!appendage) {
        return;
    }
    local parentObj = appendage.getParent();
    local sourceObj = appendage.getSource();
    parentObj = sq_GetCNRDObjectToSQRCharacter(parentObj);

    local object = sq_GetCNRDObjectToActiveObject(damagerHP);
    local id = sq_GetObjectId(object);
    appendage.getVar("damagerSta").set_vector(1, id);
}

function onStart_appendage_monsterdraw(appendage) {
    if (!appendage) {
        return;
    }

    local parentObj = appendage.getParent();
    local sourceObj = appendage.getSource();
    parentObj = sq_GetCNRDObjectToSQRCharacter(parentObj);

    appendage.getVar("damagerSta").clear_vector();
    appendage.getVar("damagerSta").push_vector(0);
    appendage.getVar("damagerSta").push_vector(0);
}