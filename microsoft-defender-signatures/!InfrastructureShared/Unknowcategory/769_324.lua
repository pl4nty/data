-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\769_324.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattributesubstring)("MpContentDetected") and ((mp.get_mpattributesubstring)("Detection:HackTool:") or (mp.get_mpattributesubstring)("Detection:VirTool:")) and not (mp.get_mpattributesubstring)("AutoKMS") then
  return mp.INFECTED
end
return mp.CLEAN

