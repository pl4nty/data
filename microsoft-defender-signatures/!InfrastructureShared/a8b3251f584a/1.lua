-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a8b3251f584a\1.luac 

-- params : ...
-- function num : 0
(bm.DisableSignature)()
local l_0_0, l_0_1 = nil, nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_0 = (this_sigattrlog[1]).utf8p2
else
  if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
    l_0_0 = (this_sigattrlog[2]).utf8p2
  end
end
if contains(l_0_0, "%-[eE][ncodemaNCODEMA]*%s+", false) then
  l_0_1 = NormalizeCmdline("powershell", l_0_0)
  if not contains(l_0_1, "downloadstring") then
    return mp.CLEAN
  end
  l_0_0 = l_0_1
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC56: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC57: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R4 in 'AssignReg'

if not ("iex")("invoke-expression", l_0_2) then
  return mp.CLEAN
end
do
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC77: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC88: Overwrote pending register: R7 in 'AssignReg'

  if ("github.com")("raw.githubusercontent.com", "bit.ly") then
    (bm.add_related_string)("PSPublicStager_cmdline", l_0_0, ("bitly.com").RelatedStringBMReport)
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

