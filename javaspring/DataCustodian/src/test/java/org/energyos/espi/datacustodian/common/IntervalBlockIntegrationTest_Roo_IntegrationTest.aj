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

import java.util.List;
import org.energyos.espi.datacustodian.common.IntervalBlock;
import org.energyos.espi.datacustodian.common.IntervalBlockDataOnDemand;
import org.energyos.espi.datacustodian.common.IntervalBlockIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect IntervalBlockIntegrationTest_Roo_IntegrationTest {
    
    declare @type: IntervalBlockIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: IntervalBlockIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: IntervalBlockIntegrationTest: @Transactional;
    
    @Autowired
    IntervalBlockDataOnDemand IntervalBlockIntegrationTest.dod;
    
    @Test
    public void IntervalBlockIntegrationTest.testCountIntervalBlocks() {
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", dod.getRandomIntervalBlock());
        long count = IntervalBlock.countIntervalBlocks();
        Assert.assertTrue("Counter for 'IntervalBlock' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void IntervalBlockIntegrationTest.testFindIntervalBlock() {
        IntervalBlock obj = dod.getRandomIntervalBlock();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to provide an identifier", id);
        obj = IntervalBlock.findIntervalBlock(id);
        Assert.assertNotNull("Find method for 'IntervalBlock' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'IntervalBlock' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void IntervalBlockIntegrationTest.testFindAllIntervalBlocks() {
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", dod.getRandomIntervalBlock());
        long count = IntervalBlock.countIntervalBlocks();
        Assert.assertTrue("Too expensive to perform a find all test for 'IntervalBlock', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<IntervalBlock> result = IntervalBlock.findAllIntervalBlocks();
        Assert.assertNotNull("Find all method for 'IntervalBlock' illegally returned null", result);
        Assert.assertTrue("Find all method for 'IntervalBlock' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void IntervalBlockIntegrationTest.testFindIntervalBlockEntries() {
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", dod.getRandomIntervalBlock());
        long count = IntervalBlock.countIntervalBlocks();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<IntervalBlock> result = IntervalBlock.findIntervalBlockEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'IntervalBlock' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'IntervalBlock' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void IntervalBlockIntegrationTest.testFlush() {
        IntervalBlock obj = dod.getRandomIntervalBlock();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to provide an identifier", id);
        obj = IntervalBlock.findIntervalBlock(id);
        Assert.assertNotNull("Find method for 'IntervalBlock' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyIntervalBlock(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'IntervalBlock' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void IntervalBlockIntegrationTest.testMergeUpdate() {
        IntervalBlock obj = dod.getRandomIntervalBlock();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to provide an identifier", id);
        obj = IntervalBlock.findIntervalBlock(id);
        boolean modified =  dod.modifyIntervalBlock(obj);
        Integer currentVersion = obj.getVersion();
        IntervalBlock merged = (IntervalBlock)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'IntervalBlock' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void IntervalBlockIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", dod.getRandomIntervalBlock());
        IntervalBlock obj = dod.getNewTransientIntervalBlock(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'IntervalBlock' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'IntervalBlock' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void IntervalBlockIntegrationTest.testRemove() {
        IntervalBlock obj = dod.getRandomIntervalBlock();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'IntervalBlock' failed to provide an identifier", id);
        obj = IntervalBlock.findIntervalBlock(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'IntervalBlock' with identifier '" + id + "'", IntervalBlock.findIntervalBlock(id));
    }
    
}
