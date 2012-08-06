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
import org.energyos.espi.datacustodian.common.TimeAttribute;
import org.energyos.espi.datacustodian.common.TimeAttributeDataOnDemand;
import org.energyos.espi.datacustodian.common.TimeAttributeEnum;
import org.springframework.stereotype.Component;

privileged aspect TimeAttributeDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TimeAttributeDataOnDemand: @Component;
    
    private Random TimeAttributeDataOnDemand.rnd = new SecureRandom();
    
    private List<TimeAttribute> TimeAttributeDataOnDemand.data;
    
    public TimeAttribute TimeAttributeDataOnDemand.getNewTransientTimeAttribute(int index) {
        TimeAttribute obj = new TimeAttribute();
        setTypeMap(obj, index);
        setTypeValue(obj, index);
        return obj;
    }
    
    public void TimeAttributeDataOnDemand.setTypeMap(TimeAttribute obj, int index) {
        Integer typeMap = new Integer(index);
        obj.setTypeMap(typeMap);
    }
    
    public void TimeAttributeDataOnDemand.setTypeValue(TimeAttribute obj, int index) {
        TimeAttributeEnum typeValue = TimeAttributeEnum.class.getEnumConstants()[0];
        obj.setTypeValue(typeValue);
    }
    
    public TimeAttribute TimeAttributeDataOnDemand.getSpecificTimeAttribute(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        TimeAttribute obj = data.get(index);
        Long id = obj.getId();
        return TimeAttribute.findTimeAttribute(id);
    }
    
    public TimeAttribute TimeAttributeDataOnDemand.getRandomTimeAttribute() {
        init();
        TimeAttribute obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return TimeAttribute.findTimeAttribute(id);
    }
    
    public boolean TimeAttributeDataOnDemand.modifyTimeAttribute(TimeAttribute obj) {
        return false;
    }
    
    public void TimeAttributeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = TimeAttribute.findTimeAttributeEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'TimeAttribute' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<TimeAttribute>();
        for (int i = 0; i < 10; i++) {
            TimeAttribute obj = getNewTransientTimeAttribute(i);
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