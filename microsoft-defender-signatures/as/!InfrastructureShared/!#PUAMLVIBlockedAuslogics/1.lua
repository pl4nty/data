-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#PUAMLVIBlockedAuslogics\1.luac 

-- params : ...
-- function num : 0
if checkProductName("Components Package") then
  return mp.CLEAN
end
if checkProductName("Shared Library") then
  return mp.CLEAN
end
if checkProductName("Package Library") then
  return mp.CLEAN
end
if checkProductName("Google Analytics Sender") then
  return mp.CLEAN
end
if checkProductName("Google Analytics Package") then
  return mp.CLEAN
end
if checkProductName("Disk Defrag Portable") then
  return mp.CLEAN
end
return mp.INFECTED

