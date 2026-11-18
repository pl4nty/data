-- Threat: !InfrastructureShared
-- Name: !#Lua:CrowtiFileName.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
    local l_0_1 = mp.getfilesize()
    if l_0_1 < 20480 or 3145728 < l_0_1 then
      return mp.CLEAN
    end
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if string.sub(l_0_2, -4) == ".exe" then
    local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_3 == "explorer.exe" then
      local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
      local l_0_5 = string.lower(MpCommon.PathToWin32Path(l_0_4))
      if (l_0_5:sub(-16) == "\\appdata\\roaming" or l_0_5:sub(-17) == "\\application data" or l_0_5:sub(-8) == "\\startup" or l_0_5:sub(-9, -8) == ":\\" and string.sub(l_0_5, -7) == string.sub(l_0_2, 0, 7)) and l_0_2:find("^[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f].exe") == 1 then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
