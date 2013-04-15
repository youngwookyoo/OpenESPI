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
import org.energyos.espi.datacustodian.common.Subscription;
import org.energyos.espi.datacustodian.common.SubscriptionDataOnDemand;
import org.energyos.espi.datacustodian.common.SubscriptionIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect SubscriptionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: SubscriptionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: SubscriptionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: SubscriptionIntegrationTest: @Transactional;
    
    @Autowired
    SubscriptionDataOnDemand SubscriptionIntegrationTest.dod;
    
    @Test
    public void SubscriptionIntegrationTest.testCountSubscriptions() {
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", dod.getRandomSubscription());
        long count = Subscription.countSubscriptions();
        Assert.assertTrue("Counter for 'Subscription' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void SubscriptionIntegrationTest.testFindSubscription() {
        Subscription obj = dod.getRandomSubscription();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to provide an identifier", id);
        obj = Subscription.findSubscription(id);
        Assert.assertNotNull("Find method for 'Subscription' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Subscription' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void SubscriptionIntegrationTest.testFindAllSubscriptions() {
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", dod.getRandomSubscription());
        long count = Subscription.countSubscriptions();
        Assert.assertTrue("Too expensive to perform a find all test for 'Subscription', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Subscription> result = Subscription.findAllSubscriptions();
        Assert.assertNotNull("Find all method for 'Subscription' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Subscription' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void SubscriptionIntegrationTest.testFindSubscriptionEntries() {
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", dod.getRandomSubscription());
        long count = Subscription.countSubscriptions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Subscription> result = Subscription.findSubscriptionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Subscription' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Subscription' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void SubscriptionIntegrationTest.testFlush() {
        Subscription obj = dod.getRandomSubscription();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to provide an identifier", id);
        obj = Subscription.findSubscription(id);
        Assert.assertNotNull("Find method for 'Subscription' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifySubscription(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Subscription' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SubscriptionIntegrationTest.testMergeUpdate() {
        Subscription obj = dod.getRandomSubscription();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to provide an identifier", id);
        obj = Subscription.findSubscription(id);
        boolean modified =  dod.modifySubscription(obj);
        Integer currentVersion = obj.getVersion();
        Subscription merged = (Subscription)obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Subscription' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void SubscriptionIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", dod.getRandomSubscription());
        Subscription obj = dod.getNewTransientSubscription(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Subscription' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Subscription' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Subscription' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void SubscriptionIntegrationTest.testRemove() {
        Subscription obj = dod.getRandomSubscription();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Subscription' failed to provide an identifier", id);
        obj = Subscription.findSubscription(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Subscription' with identifier '" + id + "'", Subscription.findSubscription(id));
    }
    
}
