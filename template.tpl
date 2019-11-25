___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Start-Expired Date",
  "categories": ["UTILITY","TAG_MANAGEMENT"],
  "description": "Activate variable when the date is valid or expired.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "fecha_actual",
    "displayName": "Today",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "{{JS - getDateNow}}",
        "displayValue": "Hoy"
      }
    ],
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY",
        "errorMessage": "Write anything"
      },
      {
        "type": "REGEX",
        "args": [
          "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))"
        ],
        "errorMessage": "Set date with format YYYY-MM-dd"
      }
    ],
    "help": "Set today"
  },
  {
    "type": "RADIO",
    "name": "control",
    "displayName": "Set date action",
    "radioItems": [
      {
        "value": "inicio",
        "displayValue": "Init at"
      },
      {
        "value": "fin",
        "displayValue": "End at"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "fecha_control",
    "displayName": "Control Date (include)",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "{{FECHA - Caducidad 1}}",
        "displayValue": "{{FECHA - Caducidad 1}}"
      }
    ],
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY",
        "errorMessage": "Write something"
      },
      {
        "type": "REGEX",
        "args": [
          "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))"
        ],
        "errorMessage": "Set date with format YYYY-MM-dd"
      }
    ],
    "alwaysInSummary": true,
    "help": "Set control Date"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var res =true;
if(data.control=="inicio"){  
  if(data.fecha_control>data.fecha_actual){
   res =false; 
  }
}
else if(data.control=="fin"){
  if(data.fecha_control<data.fecha_actual){
   res =false; 
  }
}
return res;


___TESTS___

scenarios:
- name: Validación - En vigor
  code: |-
    // Call runCode to run the template's code.
    data.fecha_control="2019-11-11";
    data.fecha_actual="2019-30-11";
    data.control="inicio";
    let variableResult = runCode();

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo("true");
- name: Validación - Caducado
  code: |-
    // Call runCode to run the template's code.
    data.fecha_control="2019-11-11";
    data.fecha_actual="2019-30-11";
    data.control="inicio";
    let variableResult = runCode();

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo("false");
setup: ''


___NOTES___

Created on 25/11/2019 12:26:44


