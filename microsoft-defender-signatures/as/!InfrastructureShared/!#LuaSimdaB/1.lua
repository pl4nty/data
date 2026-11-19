-- Threat: !InfrastructureShared
-- Name: !#Lua:Simda.B
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1:sub(-9) == "\\apppatch" then
    if peattributes.isdll then
      return mp.CLEAN
    end
    local l_0_2 = pe.get_versioninfo()
    if l_0_2 == nil then
      return mp.CLEAN
    end
    if l_0_2.CompanyName == "Microsoft Corporation" then
      return mp.CLEAN
    end
    local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
    local l_0_4 = string.len(l_0_3)
    if l_0_4 < 10 or 12 < l_0_4 then
      return mp.CLEAN
    end
    for l_0_5 = 1, l_0_4 - 4 do
      local l_0_6 = string.byte(l_0_3, l_0_5)
      if l_0_6 < 97 or 122 < l_0_6 then
        return mp.CLEAN
      end
    end
    mp.set_mpattribute("Lua:Simda.B")
  end
end
return mp.CLEAN
