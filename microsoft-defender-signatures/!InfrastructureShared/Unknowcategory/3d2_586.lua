-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\3d2_586.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1, l_0_2 = pcall(bm.get_process_relationships)
if l_0_0 then
  for l_0_6,l_0_7 in ipairs(l_0_1) do
    if l_0_7.image_path ~= nil and (mp.bitand)(l_0_7.reason_ex, 1) == 1 and l_0_7.ppid ~= nil then
      (bm.trigger_sig)("DumpADConnectCreds", "THREAT", l_0_7.ppid)
      local l_0_8 = (string.lower)(l_0_7.image_path)
      if (string.find)(l_0_8, "powershell.exe", 1, true) or (string.find)(l_0_8, "cmd.exe", 1, true) then
        (bm.add_threat_process)(l_0_7.ppid)
      end
    end
  end
end
do
  return mp.INFECTED
end

