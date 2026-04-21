-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\240b34a4757ea\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[9]).matched or (this_sigattrlog[9]).utf8p1 == nil or (this_sigattrlog[9]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[9]).utf8p1)
local l_0_1 = (string.lower)((this_sigattrlog[9]).utf8p2)
local l_0_2 = {}
-- DECOMPILER ERROR at PC38: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC39: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R5 in 'AssignReg'

if not ("\\users\\")("\\appdata\\", "\\temp\\", true) then
  return mp.CLEAN
end
local l_0_3 = false
local l_0_4 = (bm.get_imagepath)()
if l_0_4 ~= nil and l_0_0 == l_0_4 then
  do
    (bm.add_related_file)(l_0_0)
    ;
    (bm.add_related_file)(l_0_1)
    -- DECOMPILER ERROR at PC76: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC77: Overwrote pending register: R8 in 'AssignReg'

    if l_0_3 then
      (bm.add_related_string)("SelfCopyToSys32", "\\downloads\\", ("\\documents\\").RelatedStringBMReport)
    end
    TrackPidAndTechniqueBM("BM", "T1574.001", "DefenderCloudPlaceholderLPE.AM")
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

