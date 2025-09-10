-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\115d76c5a7f5c\1.luac 

-- params : ...
-- function num : 0
if IsBasToolProcessForPpid("CMDHSTR", "SafeBreach", "AccessibilityEscalation") or IsBasToolProcessFoundInParents("CMDHSTR", "SafeBreach", 3, "AccessibilityEscalation") then
  return mp.INFECTED
end
return mp.CLEAN

