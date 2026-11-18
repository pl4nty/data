-- Threat: !InfrastructureShared
-- Name: !#Lua:DownloadFileName.B
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  local l_0_3 = string.len(l_0_2)
  if 11 < l_0_3 and l_0_3 <= 19 and string.sub(l_0_2, 1, 7) == "update_" and string.sub(l_0_1, -5) == "\\temp" and string.sub(l_0_2, -4) == ".exe" then
    for l_0_4 = 8, l_0_3 - 4 do
      local l_0_5 = string.byte(l_0_2, l_0_4)
      if l_0_5 < 48 or 57 < l_0_5 then
        return mp.CLEAN
      end
    end
    mp.set_mpattribute("Lua:DalexisDownloadFileName.A")
  elseif string.len(l_0_2) <= 8 and string.sub(l_0_2, 1, 3) == "mss" and string.sub(l_0_1, -5) == "\\temp" and string.sub(l_0_2, -4) == ".exe" then
    mp.set_mpattribute("Lua:LerspengDownloadFileName.A")
  end
end
return mp.CLEAN
