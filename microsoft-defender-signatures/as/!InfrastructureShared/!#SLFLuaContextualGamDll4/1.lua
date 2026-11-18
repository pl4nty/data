-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:ContextualGamDll4
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  if not peattributes.isdll then
    return mp.CLEAN
  end
  if not peattributes.hasexports then
    return mp.CLEAN
  end
  if pehdr.DataDirectory[1].Size == 0 then
    return mp.CLEAN
  end
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  local l_0_2 = {
    [".exe"] = true,
    [".dll"] = true,
    [".cpl"] = true,
    [".ocx"] = true,
    [".pyd"] = true,
    [".pyc"] = true
  }
  if l_0_2[string.lower(l_0_1):sub(-4)] then
    return mp.CLEAN
  end
  local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
  if not l_0_3:find("\160", 1, true) then
    return mp.CLEAN
  end
  if string.find(string.lower(l_0_3), "\\windows\\temp\\", 1, true) then
    return mp.CLEAN
  end
  if (l_0_1:find("^{?[%w%p]+}?%.{%w%w%w%w%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%w%w%w%w%w%w%w%w}$") or l_0_1:find("^%p%p%p+%.%d$")) and (string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "msiexec.exe" or string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "rundll32.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
