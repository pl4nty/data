-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Posilod\0x00001a95_luac 

-- params : ...
-- function num : 0
if (string.find)((Remediation.Threat).Name, "^Trojan:Win64/Posilod%.E") == nil then
  return 
end
local l_0_0 = (Remediation.Threat).Name
local l_0_1 = {}
l_0_1["Trojan:Win64/Posilod.EB"] = true
l_0_1["Trojan:Win64/Posilod.EC"] = true
l_0_1["Trojan:Win64/Posilod.ED"] = true
l_0_1["Trojan:Win64/Posilod.EF"] = true
l_0_1["Trojan:Win64/Posilod.EG"] = true
if l_0_1[l_0_0] == nil then
  return 
end
for l_0_5,l_0_6 in pairs((Remediation.Threat).Resources) do
  if l_0_6.Schema == "file" and (crypto.bitand)(l_0_6.Type, MpCommon.MPRESOURCE_TYPE_CONCRETE) == MpCommon.MPRESOURCE_TYPE_CONCRETE then
    local l_0_7 = l_0_6.Path
    if l_0_7 ~= nil and (string.find)((string.lower)(l_0_7), "onedrive", 1, true) ~= nil then
      local l_0_8, l_0_9, l_0_10 = Infrastructure_SplitThreatPath(l_0_7)
      if l_0_10 == "filesyncclient.dll" then
        local l_0_11 = l_0_8:match("(.*\\)[^\\]+\\$")
        local l_0_12 = l_0_11 .. "OneDrive.exe"
        if (sysio.IsFileExists)(l_0_12) then
          local l_0_13 = (sysio.GetProcessFromFileName)(l_0_12)
          for l_0_17,l_0_18 in pairs(l_0_13) do
            local l_0_19 = (string.format)("pid:%d,ProcessStart:%u", l_0_18.pid, l_0_18.starttime)
            ;
            (sysio.TerminateProcess)(l_0_19)
          end
        end
      end
    end
  end
end

