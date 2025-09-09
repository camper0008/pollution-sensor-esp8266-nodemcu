local function alarm_invoked()
    local value = adc.read(0)
    http.post(
        string.format("http://%s/%d/%d", URL, value, TYPE), 
        "",
        "",
        function(code, data)
            print(string.format("POST 'http://%s/%d/%d' returned code '%d'", URL, value, TYPE, code));
        end
    )
end

application_start = function()
    adc.force_init_mode(adc.INIT_ADC)
    mytimer = tmr.create()
    mytimer:alarm(1000, tmr.ALARM_AUTO, alarm_invoked)
end
