-- Threat: !InfrastructureShared
-- Name: !#Lua:FakePAVFileName.A
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if string.sub(l_0_2, -4) == ".exe" then
    if string.sub(l_0_1, -16) == "\\appdata\\roaming" or string.sub(l_0_1, -17) == "\\application data" then
      if string.len(l_0_2) == 14 and string.sub(l_0_2, 1, 6) == "guard-" then
        mp.set_mpattribute("Lua:FakePAVFileName.A")
      elseif string.len(l_0_2) == 15 and string.sub(l_0_2, 1, 7) == "protect" then
        mp.set_mpattribute("Lua:FakePAVFileName.B")
      elseif string.len(l_0_2) == 13 and string.sub(l_0_2, 1, 5) == "safe-" then
        mp.set_mpattribute("Lua:FakePAVFileName.C")
      elseif string.len(l_0_2) == 12 and string.sub(l_0_2, 1, 4) == "svc-" then
        mp.set_mpattribute("Lua:FakePAVFileName.D")
      end
    elseif l_0_2 == "file.exe" and (string.sub(l_0_1, -19) == "\\appdata\\local\\temp" or string.sub(l_0_1, -20) == "\\local settings\\temp") then
      local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
      if l_0_3 == "wscript.exe" then
        mp.set_mpattribute("Lua:FakePAVFileName.E")
      end
    end
  end
end
return mp.CLEAN
