/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/


// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.common;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.energyos.espi.datacustodian.common._RetailCustomer;
import org.energyos.espi.datacustodian.common._RetailCustomerDataOnDemand;
import org.springframework.stereotype.Component;

privileged aspect _RetailCustomerDataOnDemand_Roo_DataOnDemand {
    
    declare @type: _RetailCustomerDataOnDemand: @Component;
    
    private Random _RetailCustomerDataOnDemand.rnd = new SecureRandom();
    
    private List<_RetailCustomer> _RetailCustomerDataOnDemand.data;
    
    public _RetailCustomer _RetailCustomerDataOnDemand.getNewTransient_RetailCustomer(int index) {
        _RetailCustomer obj = new _RetailCustomer();
        setRetailCustomerID(obj, index);
        return obj;
    }
    
    public void _RetailCustomerDataOnDemand.setRetailCustomerID(_RetailCustomer obj, int index) {
        String retailCustomerID = "retailCustomerID_" + index;
        obj.setRetailCustomerID(retailCustomerID);
    }
    
    public _RetailCustomer _RetailCustomerDataOnDemand.getSpecific_RetailCustomer(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        _RetailCustomer obj = data.get(index);
        Long id = obj.getId();
        return _RetailCustomer.find_RetailCustomer(id);
    }
    
    public _RetailCustomer _RetailCustomerDataOnDemand.getRandom_RetailCustomer() {
        init();
        _RetailCustomer obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return _RetailCustomer.find_RetailCustomer(id);
    }
    
    public boolean _RetailCustomerDataOnDemand.modify_RetailCustomer(_RetailCustomer obj) {
        return false;
    }
    
    public void _RetailCustomerDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = _RetailCustomer.find_RetailCustomerEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for '_RetailCustomer' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<_RetailCustomer>();
        for (int i = 0; i < 10; i++) {
            _RetailCustomer obj = getNewTransient_RetailCustomer(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
