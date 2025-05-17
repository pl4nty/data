-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\224_luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("Detection:Backdoor:Win32/ExchgReflectiveAssembly.A!SuspAssembly") then
  return mp.CLEAN
end
local l_0_0 = (mp.enum_mpattributesubstring)("Lua:PeOriginalName!")
if not l_0_0 or #l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = false
local l_0_4, l_0_5 = nil, nil
local l_0_6 = (mp.GetProcessCommandLine)(l_0_2)
if l_0_6 then
  l_0_4 = ((string.lower)(l_0_6)):match("-ap \"([^\"]+)\"")
  if l_0_4 ~= nil then
    l_0_3 = true
  end
end
if #l_0_0 == 1 then
  l_0_5 = l_0_0[#l_0_0]
  if l_0_5 ~= nil then
    l_0_5 = ((string.lower)(l_0_5)):match("lua:peoriginalname!(.*)$")
  end
end
if l_0_5 and l_0_3 then
  local l_0_7 = (string.format)("InMemoryLoadBlocked: Application: \'%s\', Module: \'%s\'", l_0_4, l_0_5)
  ;
  (mp.SetAmsiReportPath)(l_0_7)
else
  do
    do
      if l_0_5 and not l_0_3 then
        local l_0_8 = (string.format)("InMemoryLoadBlocked: Module: \'%s\'", l_0_5)
        ;
        (mp.SetAmsiReportPath)(l_0_8)
      end
      return mp.CLEAN
    end
  end
end

