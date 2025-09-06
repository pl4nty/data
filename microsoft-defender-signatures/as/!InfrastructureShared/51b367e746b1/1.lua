-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51b367e746b1\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (bm.get_process_relationships)()
for l_0_5,l_0_6 in ipairs(l_0_0) do
  if l_0_6.image_path ~= nil and (mp.bitand)(l_0_6.reason_ex, 1) == 1 and ((string.lower)((string.sub)(l_0_6.image_path, -13)) == "\\sqlservr.exe" or (string.lower)((string.sub)(l_0_6.image_path, -13)) == "\\sqlagent.exe") then
    local l_0_7, l_0_8 = pcall(reportBmInfo)
    if not l_0_7 and l_0_8 then
      (bm.add_related_string)("bmInfoFailReason", tostring(l_0_8), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN

