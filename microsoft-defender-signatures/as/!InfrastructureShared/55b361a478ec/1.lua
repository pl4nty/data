-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\55b361a478ec\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched and (this_sigattrlog[4]).utf8p2 ~= nil then
    local l_0_0 = nil
    if (string.find)(l_0_0, ".key", 1, true) or (string.find)(l_0_0, ".gpg", 1, true) or (string.find)(l_0_0, ".pgp", 1, true) or (string.find)(l_0_0, ".ppk", 1, true) or (string.find)(l_0_0, ".p12", 1, true) or (string.find)(l_0_0, ".pem", 1, true) or (string.find)(l_0_0, ".pfx", 1, true) or (string.find)(l_0_0, ".cer", 1, true) or (string.find)(l_0_0, ".p7b", 1, true) or (string.find)(l_0_0, ".asc", 1, true) or (string.find)(l_0_0, ".kbdx", 1, true) then
      TrackPidAndTechniqueBM("BM", "T1552.004", "CredentialAccess_PrivateKeys")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

