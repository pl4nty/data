-- Threat: !InfrastructureShared
-- Name: 8db37627401a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1, l_0_2 = pcall(bm.get_process_relationships)
if l_0_0 then
  for l_0_3, l_0_4 in ipairs(l_0_1) do
    if l_0_4.image_path ~= nil and mp.bitand(l_0_4.reason_ex, 1) == 1 and l_0_4.ppid ~= nil then
      bm.trigger_sig("DumpADConnectCreds", "THREAT", l_0_4.ppid)
      local l_0_5 = string.lower(l_0_4.image_path)
      if string.find(l_0_5, "powershell.exe", 1, true) or string.find(l_0_5, "cmd.exe", 1, true) then
        bm.add_threat_process(l_0_4.ppid)
      end
    end
  end
end
local l_0_6, l_0_7 = pcall(reportBmInfo)
if not l_0_6 and l_0_7 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_7), bm.RelatedStringBMReport)
end
return mp.INFECTED
