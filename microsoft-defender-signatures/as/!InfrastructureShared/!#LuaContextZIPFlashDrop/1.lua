-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextZIPFlashDrop
-- Type: 13

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 67324752 then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 ~= nil and l_0_1:sub(1, 9) == "flashutil" then
    local l_0_2 = false
    local l_0_3 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_3 ~= nil and l_0_3:len() > 15 and l_0_3:find("\\spool\\printers", 1, true) ~= nil then
      l_0_2 = true
    end
    if not l_0_2 then
      if mp.readu_u16(headerpage, 9) == 0 then
        mp.set_mpattribute("Lua:ContextZIPNoCompressionFlashDrop.A")
      else
        mp.set_mpattribute("Lua:ContextZIPFlashDrop.A")
      end
    end
  end
end
return mp.CLEAN
