-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a346_510.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 ~= nil then
  l_0_0 = (string.lower)(l_0_0)
  local l_0_1 = (crypto.Sha256Buffer)(l_0_0, 0, #l_0_0)
  local l_0_2 = {}
  l_0_2["97323d162dc5f479a733a221f90370120974579ffefb248882764ed158ed49ff"] = true
  l_0_2["40207e9e7af8b0e07eee5ca2f51b438318f7a0560ef1e4a2238efb813379350d"] = true
  l_0_2.df578c8e24df5935bedf03728f1ecd7473f351c863325bf517419233d2712742 = true
  if l_0_2[l_0_1] then
    return mp.CLEAN
  end
end
do
  return mp.INFECTED
end

