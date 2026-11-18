-- Threat: !InfrastructureShared
-- Name: !#SLF:Win32/MasqMSName
-- Type: 10
-- MpAttributes: pea_ismsil & (HSTR:LightNeuronTransportAgent.1 | HSTR:LightNeuronTransportAgent.2 | HSTR:LightNeuronTransportAgent.3)

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:find("microsoft.griffin.mlagilityservice.dll", 1, true) ~= nil then
  return mp.CLEAN
end
local l_0_1 = pe.get_versioninfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.CompanyName
if l_0_2 ~= nil then
  l_0_2 = string.lower(l_0_2)
  local l_0_3 = {
    ["microsoft corporation"] = "Lua:Company_Microsoft",
    ["microsoft corp."] = "Lua:Company_Microsoft"
  }
  if l_0_3[l_0_2] ~= nil then
    return mp.CLEAN
  end
  local l_0_4 = l_0_1.InternalName
  local l_0_5 = l_0_1.OriginalFilename
  if l_0_4 then
    l_0_4 = string.lower(l_0_4)
    if string.find(l_0_4, "microsoft.", 1, true) == 1 and l_0_5 then
      l_0_5 = string.lower(l_0_5)
      if string.find(l_0_5, "microsoft.", 1, true) == 1 then
        local l_0_6 = l_0_4:match("(.+)%..+")
        if l_0_6 ~= l_0_2 then
          return mp.INFECTED
        end
      end
    end
  end
end
return mp.CLEAN
