-- Threat: !InfrastructureShared
-- Name: !#Lua:Leenstic.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if string.sub(l_0_1, -17) == "\\application data" or string.sub(l_0_1, -16) == "\\appdata\\roaming" then
    local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
    local l_0_3 = string.len(l_0_2)
    if l_0_3 ~= 10 then
      return mp.CLEAN
    end
    for l_0_4 = 1, l_0_3 - 4 do
      local l_0_5 = string.byte(l_0_2, l_0_4)
      if l_0_5 < 48 or 57 < l_0_5 then
        return mp.CLEAN
      end
    end
    local l_0_6 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_ATTRIBUTES)
    if mp.bitand(l_0_6, 3) ~= 0 then
      mp.set_mpattribute("Lua:Leenstic.A")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
