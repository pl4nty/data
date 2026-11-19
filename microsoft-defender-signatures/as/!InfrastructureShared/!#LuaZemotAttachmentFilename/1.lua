-- Threat: !InfrastructureShared
-- Name: !#Lua:ZemotAttachmentFilename
-- Type: 8

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_2 = string.len(l_0_1)
  if 15 < l_0_2 and l_0_2 <= 30 and string.sub(l_0_1, 1, 9) == "rechnung_" and string.sub(l_0_1, -4) == ".exe" then
    for l_0_3 = 10, l_0_2 - 4 do
      local l_0_4 = string.byte(l_0_1, l_0_3)
      if l_0_4 < 48 or 57 < l_0_4 then
        return mp.CLEAN
      end
    end
    mp.set_mpattribute("Lua:ZemotAttachmentFilename.A")
  end
end
return mp.CLEAN
