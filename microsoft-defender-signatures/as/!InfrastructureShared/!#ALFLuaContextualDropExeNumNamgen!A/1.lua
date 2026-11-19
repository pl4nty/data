-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:ContextualDropExeNumNam.gen!A
-- Type: 9

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  if not peattributes.isexe then
    return mp.CLEAN
  end
  if peattributes.isdriver then
    return mp.CLEAN
  end
  if not peattributes.no_security then
    return mp.CLEAN
  end
  local l_0_0 = mp.getfilesize()
  if 1000000 < l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:len() >= 5 then
    if l_0_1:find("^%d+%[%d%]%.exe$") == 1 then
      return mp.INFECTED
    end
    if l_0_1:find("^%d+%.exe$") == 1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
