-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11cd77b803e08\1.luac 

-- params : ...
-- function num : 0
if checkParentProcessNameFromListByPPIDRecursive("CMDHSTR", "|verodin_backend.exe|", 3) then
  return mp.INFECTED
end
return mp.CLEAN

