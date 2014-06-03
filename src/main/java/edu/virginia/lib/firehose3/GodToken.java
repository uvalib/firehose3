
/*******************************************************************************
* Copyright 2014 The Rector and Visitors of the University of Virginia
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
******************************************************************************/

package edu.virginia.lib.firehose3;

public class GodToken {
 
	// Declare private vars
    private String currentWebSessionToken = null;
    private String previousWebSessionToken = null;
    private String currentJavaSessionToken = null;
    private String previousJavaSessionToken = null;
    
        
    // SIRSI WEB Client Session Getters/Setters
    
	public String getCurrentWebSessionToken() {
	  return currentWebSessionToken;
	}

	public void setCurrentWebSessionToken(String token) {
		if (currentWebSessionToken != null) {
			setPreviousWebSessionToken(currentWebSessionToken);
		}
		currentWebSessionToken =  token;
	}

	// Getters/Setters for previous Session Token, if needed
    public String getPreviousWebSessionToken() {
	  return previousWebSessionToken;
	}

	public void setPreviousWebSessionToken(String token) {
		previousWebSessionToken =  getCurrentWebSessionToken();
    }


	// JAVA Client Session Getters/Setters
    
	public String getCurrentJavaSessionToken() {
	  return currentJavaSessionToken;
	}

	public void setCurrentJavaSessionToken(String token) {
		if (currentJavaSessionToken != null) {
			setPreviousJavaSessionToken(currentJavaSessionToken);
		}
		currentJavaSessionToken =  token;
	}

    public String getPreviousJavaSessionToken() {
	  return previousJavaSessionToken;
	}

	public void setPreviousJavaSessionToken(String token) {
		previousJavaSessionToken =  getCurrentJavaSessionToken();
    }


}




