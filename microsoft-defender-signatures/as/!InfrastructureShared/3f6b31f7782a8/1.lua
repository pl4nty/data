-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3f6b31f7782a8\1.luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
local l_0_0, l_0_1 = nil, nil
if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[9]).utf8p2
else
  if (this_sigattrlog[10]).matched and (this_sigattrlog[10]).utf8p2 ~= nil then
    l_0_0 = (this_sigattrlog[10]).utf8p2
  end
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if not contains(l_0_1, "downloadstring") then
    return mp.CLEAN
  end
  l_0_0 = l_0_1
end
if not isIEXfound(l_0_0) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC63: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC64: Overwrote pending register: R3 in 'AssignReg'

if ("raw.githubusercontent.com")(l_0_0, l_0_2) and IsSuspPSModule(l_0_0) then
  (bm.add_related_string)("PSPublicStager_c_cmdline", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN

