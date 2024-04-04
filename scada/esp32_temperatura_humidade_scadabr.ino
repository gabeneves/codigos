// Projeto em andamento ainda (nao esta totalmente pronto)

#include <ESP8266.h>
#include <SoftwareSerial.h>
#include <Modbus.h>
#include <ModbusIP_ESP8266.h> // Para Scada

SoftwareSerial wifiSerial(2 , 3);
ESP8266 wifi(wifiSerial, 9600);

// Modbus Registers Offsets (0-9999)
const int sensorPin = 0; // Pinagem
const int SENSOR_I_REG = 0;


// ModbusIP objeto
ModbusIP mb;

long ts;

void setup() {
    // Configuracao Modbus IP
    mb.config(wifi, "xxx", "xxx");

    // Add o registrador SENSOR_I_REG
    mb.addIreg(SENSOR_I_REG);

    ts = millis();
}

void loop() {
   mb.task();

   // le a cada dois segundos
   if (millis() > ts + 2000) {
       ts = millis();
       mb.Ireg(SENSOR_I_REG, analogRead(sensorPin));
   }
}