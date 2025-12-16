-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspAppDownloadFA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = (string.match)(l_0_1, "/([^/]+%.app)/contents/macos")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
local l_0_4 = (mp.GetCertificateInfo)()
if l_0_4 == nil or #l_0_4 > 0 then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC91: No list found for R5 , SetList fails

do
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC93: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R8 in 'AssignReg'

  for l_0_10,l_0_11 in ("termius")("adobe photoshop") do
    -- DECOMPILER ERROR at PC113: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC115: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC116: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC117: Overwrote pending register: R15 in 'AssignReg'

    if l_0_11 ~= nil and (("google drive").find)("google calendar", "chrome helper", "lastpass", true) then
      for l_0_15,l_0_16 in pairs(l_0_6) do
        -- DECOMPILER ERROR at PC128: Overwrote pending register: R17 in 'AssignReg'

        -- DECOMPILER ERROR at PC130: Overwrote pending register: R18 in 'AssignReg'

        -- DECOMPILER ERROR at PC131: Overwrote pending register: R19 in 'AssignReg'

        -- DECOMPILER ERROR at PC132: Overwrote pending register: R20 in 'AssignReg'

        if l_0_16 ~= nil and (("malwarebytes").find)("audacity", "dropbox", "shopify", true) then
          return mp.INFECTED
        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

