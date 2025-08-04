local function alarm_invoked()
    local pollution = adc.read(0)
    http.post(
        string.format("http://polsensor.tpho.dk/api/log/%d", pollution), 
        "",
        "",
        function(code, data)
            print("returned code", code);
        end
    )
end

application_start = function()
    adc.force_init_mode(adc.INIT_ADC)
    mytimer = tmr.create()
    mytimer:alarm(1000, tmr.ALARM_AUTO, alarm_invoked)
end
