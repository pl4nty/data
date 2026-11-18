-- Threat: !InfrastructureShared
-- Name: !#Lua:CrowtiFileName.B
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.getfilesize()
  if l_0_1 < 20480 or 3145728 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if string.sub(l_0_2, -4) == ".exe" then
    local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if (l_0_3:sub(-16) == "\\appdata\\roaming" or l_0_3:sub(-17) == "\\application data" or l_0_3:sub(-8) == "\\startup" or l_0_3:sub(-10, -9) == ":\\" and string.sub(l_0_3, -8) == string.sub(l_0_2, 0, 8)) and l_0_2:find("^[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f].exe") == 1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
