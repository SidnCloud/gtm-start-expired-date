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
  "description": "Control to check if the date setted is expired or valid (by SIDN)",
  "categories": ["UTILITY"],
  "containerContexts": [
    "WEB"
  ],
  "brand": {
    "displayName": "Start-Expired Date"
  }
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
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))"
        ]
      }
    ],
    "help": "Set the JS variable to place today"
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
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))"
        ]
      }
    ],
    "alwaysInSummary": true,
    "help": "Introduce la fecha de caducidad, preferiblemente en una variable de fecha"
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

scenarios: []


___NOTES___

Created on 25/11/2019 1:23:13


