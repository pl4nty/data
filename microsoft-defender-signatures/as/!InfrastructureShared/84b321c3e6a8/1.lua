-- Threat: !InfrastructureShared
-- Name: 84b321c3e6a8
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = safeJsonDeserialize(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = l_0_1.appended_ext or nil
if not l_0_2 then
  return mp.CLEAN
end
bm.trigger_sig("GenericRansomware:Extension", l_0_2)
bm.add_related_string("GenericRansomware_Extension", l_0_2, bm.RelatedStringBMReport)
local l_0_3 = {
  ["._locked"] = true,
  [".akira"] = true,
  [".avdn"] = true,
  [".avos"] = true,
  [".avos2"] = true,
  [".babuk2"] = true,
  [".basta"] = true,
  [".blackbyte"] = true,
  [".blacksuit"] = true,
  [".babyk"] = true,
  [".cerber"] = true,
  [".cerber2"] = true,
  [".cerber3"] = true,
  [".ciop"] = true,
  [".c_i0p"] = true,
  [".cryptolocker"] = true,
  [".coaq"] = true,
  [".cosakos"] = true,
  [".cuba"] = true,
  [".cymcrypt"] = true,
  [".dark_power"] = true,
  [".devil"] = true,
  [".dharma"] = true,
  [".eight"] = true,
  [".encryptedyourfiles"] = true,
  [".enigma"] = true,
  [".everest"] = true,
  [".fargo"] = true,
  [".foty"] = true,
  [".fs0ciety"] = true,
  [".gatz"] = true,
  [".gazprom"] = true,
  [".hack0"] = true,
  [".itlock3"] = true,
  [".itlock4"] = true,
  [".jyos"] = true,
  [".karma"] = true,
  [".kigatsu"] = true,
  [".kitz"] = true,
  [".l0cked"] = true,
  [".lockbit"] = true,
  [".locky"] = true,
  [".mallox"] = true,
  [".malox"] = true,
  [".medusa"] = true,
  [".met@n"] = true,
  [".neqp"] = true,
  [".niwm"] = true,
  [".nokonoko"] = true,
  [".nokoyawa"] = true,
  [".pandora"] = true,
  [".play"] = true,
  [".proton"] = true,
  [".qotr"] = true,
  [".quantum"] = true,
  [".ranzylocked"] = true,
  [".rook"] = true,
  [".royal"] = true,
  [".royal_w"] = true,
  [".rsnslocked"] = true,
  [".shino"] = true,
  [".thor"] = true,
  [".tury"] = true,
  [".venus"] = true,
  [".v-society"] = true,
  [".weon"] = true,
  [".wikon"] = true,
  [".wncry"] = true,
  [".wncryt"] = true,
  [".zatp"] = true,
  [".zepto"] = true,
  [".rhysida"] = true,
  [".nukrypt"] = true,
  [".__nist_k571__"] = true,
  [".sb_locked"] = true,
  [".encrypted.lock"] = true,
  [".ttx"] = true
}
if l_0_3[l_0_2] == true then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
