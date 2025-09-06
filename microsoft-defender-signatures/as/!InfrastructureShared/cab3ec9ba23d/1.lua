-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\cab3ec9ba23d\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  local l_0_0 = nil
  if l_0_0 ~= nil and (string.len)(l_0_0) > 3 and contains(l_0_0, " copy ") and contains(l_0_0, "\\windows\\temp\\") and (contains(l_0_0, "\\share$\\") or contains(l_0_0, "\\admin$\\") or contains(l_0_0, " \\\\") or contains(l_0_0, " \"\"\\\\")) then
    bm_AddRelatedFileFromCommandLine(l_0_0)
    local l_0_1, l_0_2 = pcall(reportBmInfo)
    if not l_0_1 and l_0_2 then
      (bm.add_related_string)("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

