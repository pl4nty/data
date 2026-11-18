-- Threat: !InfrastructureShared
-- Name: 207866bfcc51
-- Type: 21

if peattributes.isexe and peattributes.ismsil and peattributes.has_msilresources then
  return mp.INFECTED
end
return mp.CLEAN
