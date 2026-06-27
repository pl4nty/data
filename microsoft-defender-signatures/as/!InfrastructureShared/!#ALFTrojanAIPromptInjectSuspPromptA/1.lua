-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIPromptInjectSuspPromptA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage)
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
local l_0_2 = l_0_0
if l_0_1 ~= nil and #l_0_1 > 0 then
  l_0_2 = l_0_0 .. l_0_1
end
if #l_0_2 < 10 then
  return mp.CLEAN
end
local l_0_3 = 60
local l_0_4 = false
local l_0_5 = {}
local l_0_6 = {}
-- DECOMPILER ERROR at PC36: No list found for R6 , SetList fails

local l_0_7 = {}
-- DECOMPILER ERROR at PC38: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC39: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC41: No list found for R7 , SetList fails

local l_0_8 = {}
-- DECOMPILER ERROR at PC43: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC44: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC46: No list found for R8 , SetList fails

local l_0_9 = {}
-- DECOMPILER ERROR at PC48: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC49: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC51: No list found for R9 , SetList fails

local l_0_10 = {}
-- DECOMPILER ERROR at PC53: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC54: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC56: No list found for R10 , SetList fails

local l_0_11 = {}
-- DECOMPILER ERROR at PC58: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC59: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC61: No list found for R11 , SetList fails

local l_0_12 = {}
-- DECOMPILER ERROR at PC63: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC64: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC66: No list found for R12 , SetList fails

local l_0_13 = {}
-- DECOMPILER ERROR at PC68: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC69: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC71: No list found for R13 , SetList fails

local l_0_14 = {}
-- DECOMPILER ERROR at PC73: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC74: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC76: No list found for R14 , SetList fails

-- DECOMPILER ERROR at PC77: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC85: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC86: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC90: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC91: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC95: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC96: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC100: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC101: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC105: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC106: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC107: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC110: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC112: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC117: Overwrote pending register: R17 in 'AssignReg'

local l_0_15 = {}
-- DECOMPILER ERROR at PC123: No list found for R15 , SetList fails

local l_0_16 = {}
-- DECOMPILER ERROR at PC125: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC126: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC128: No list found for R16 , SetList fails

local l_0_17 = {}
-- DECOMPILER ERROR at PC130: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC131: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC133: No list found for R17 , SetList fails

local l_0_18 = {}
-- DECOMPILER ERROR at PC135: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC136: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC138: No list found for R18 , SetList fails

local l_0_19 = {}
-- DECOMPILER ERROR at PC140: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC141: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC143: No list found for R19 , SetList fails

local l_0_20 = {}
-- DECOMPILER ERROR at PC145: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC146: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC148: No list found for R20 , SetList fails

local l_0_21 = {}
-- DECOMPILER ERROR at PC150: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC153: No list found for R21 , SetList fails

local l_0_22 = {}
-- DECOMPILER ERROR at PC155: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC156: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC158: No list found for R22 , SetList fails

local l_0_23 = {}
-- DECOMPILER ERROR at PC160: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC161: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC163: No list found for R23 , SetList fails

local l_0_24 = {}
-- DECOMPILER ERROR at PC165: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC166: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC168: No list found for R24 , SetList fails

local l_0_25 = {}
-- DECOMPILER ERROR at PC170: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC171: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC173: No list found for R25 , SetList fails

local l_0_26 = {}
-- DECOMPILER ERROR at PC175: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC176: Overwrote pending register: R28 in 'AssignReg'

-- DECOMPILER ERROR at PC178: No list found for R26 , SetList fails

local l_0_27 = {}
-- DECOMPILER ERROR at PC180: Overwrote pending register: R28 in 'AssignReg'

-- DECOMPILER ERROR at PC181: Overwrote pending register: R29 in 'AssignReg'

-- DECOMPILER ERROR at PC183: No list found for R27 , SetList fails

local l_0_28 = {}
-- DECOMPILER ERROR at PC185: Overwrote pending register: R29 in 'AssignReg'

-- DECOMPILER ERROR at PC186: Overwrote pending register: R30 in 'AssignReg'

-- DECOMPILER ERROR at PC188: No list found for R28 , SetList fails

local l_0_29 = {}
-- DECOMPILER ERROR at PC190: Overwrote pending register: R30 in 'AssignReg'

-- DECOMPILER ERROR at PC191: Overwrote pending register: R31 in 'AssignReg'

-- DECOMPILER ERROR at PC193: No list found for R29 , SetList fails

local l_0_30 = {}
-- DECOMPILER ERROR at PC195: Overwrote pending register: R31 in 'AssignReg'

-- DECOMPILER ERROR at PC196: Overwrote pending register: R32 in 'AssignReg'

-- DECOMPILER ERROR at PC198: No list found for R30 , SetList fails

local l_0_31 = {}
-- DECOMPILER ERROR at PC200: Overwrote pending register: R32 in 'AssignReg'

-- DECOMPILER ERROR at PC201: Overwrote pending register: R33 in 'AssignReg'

-- DECOMPILER ERROR at PC203: No list found for R31 , SetList fails

local l_0_32 = {}
-- DECOMPILER ERROR at PC205: Overwrote pending register: R33 in 'AssignReg'

-- DECOMPILER ERROR at PC206: Overwrote pending register: R34 in 'AssignReg'

-- DECOMPILER ERROR at PC208: No list found for R32 , SetList fails

local l_0_33 = {}
-- DECOMPILER ERROR at PC210: Overwrote pending register: R34 in 'AssignReg'

-- DECOMPILER ERROR at PC211: Overwrote pending register: R35 in 'AssignReg'

-- DECOMPILER ERROR at PC213: No list found for R33 , SetList fails

local l_0_34 = {}
-- DECOMPILER ERROR at PC215: Overwrote pending register: R35 in 'AssignReg'

-- DECOMPILER ERROR at PC216: Overwrote pending register: R36 in 'AssignReg'

-- DECOMPILER ERROR at PC218: No list found for R34 , SetList fails

local l_0_35 = {}
-- DECOMPILER ERROR at PC220: Overwrote pending register: R36 in 'AssignReg'

-- DECOMPILER ERROR at PC221: Overwrote pending register: R37 in 'AssignReg'

-- DECOMPILER ERROR at PC223: No list found for R35 , SetList fails

local l_0_36 = {}
-- DECOMPILER ERROR at PC225: Overwrote pending register: R37 in 'AssignReg'

-- DECOMPILER ERROR at PC226: Overwrote pending register: R38 in 'AssignReg'

-- DECOMPILER ERROR at PC228: No list found for R36 , SetList fails

local l_0_37 = {}
-- DECOMPILER ERROR at PC230: Overwrote pending register: R38 in 'AssignReg'

-- DECOMPILER ERROR at PC231: Overwrote pending register: R39 in 'AssignReg'

-- DECOMPILER ERROR at PC233: No list found for R37 , SetList fails

local l_0_38 = {}
-- DECOMPILER ERROR at PC235: Overwrote pending register: R39 in 'AssignReg'

-- DECOMPILER ERROR at PC236: Overwrote pending register: R40 in 'AssignReg'

-- DECOMPILER ERROR at PC238: No list found for R38 , SetList fails

local l_0_39 = {}
-- DECOMPILER ERROR at PC240: Overwrote pending register: R40 in 'AssignReg'

-- DECOMPILER ERROR at PC241: Overwrote pending register: R41 in 'AssignReg'

-- DECOMPILER ERROR at PC243: No list found for R39 , SetList fails

local l_0_40 = {}
-- DECOMPILER ERROR at PC245: Overwrote pending register: R41 in 'AssignReg'

-- DECOMPILER ERROR at PC246: Overwrote pending register: R42 in 'AssignReg'

-- DECOMPILER ERROR at PC248: No list found for R40 , SetList fails

local l_0_41 = {}
-- DECOMPILER ERROR at PC250: Overwrote pending register: R42 in 'AssignReg'

-- DECOMPILER ERROR at PC251: Overwrote pending register: R43 in 'AssignReg'

-- DECOMPILER ERROR at PC253: No list found for R41 , SetList fails

local l_0_42 = {}
-- DECOMPILER ERROR at PC255: Overwrote pending register: R43 in 'AssignReg'

-- DECOMPILER ERROR at PC256: Overwrote pending register: R44 in 'AssignReg'

-- DECOMPILER ERROR at PC258: No list found for R42 , SetList fails

-- DECOMPILER ERROR at PC262: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC263: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC264: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC267: Overwrote pending register: R10 in 'AssignReg'

-- DECOMPILER ERROR at PC268: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC269: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC272: Overwrote pending register: R11 in 'AssignReg'

-- DECOMPILER ERROR at PC273: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC274: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC277: Overwrote pending register: R12 in 'AssignReg'

-- DECOMPILER ERROR at PC278: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC279: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC282: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC283: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC287: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC288: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC292: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC293: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC297: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC298: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC302: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC303: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC307: Overwrote pending register: R18 in 'AssignReg'

-- DECOMPILER ERROR at PC308: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC312: Overwrote pending register: R19 in 'AssignReg'

-- DECOMPILER ERROR at PC313: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC317: Overwrote pending register: R20 in 'AssignReg'

-- DECOMPILER ERROR at PC318: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC322: Overwrote pending register: R21 in 'AssignReg'

-- DECOMPILER ERROR at PC323: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC327: Overwrote pending register: R22 in 'AssignReg'

-- DECOMPILER ERROR at PC328: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC332: Overwrote pending register: R23 in 'AssignReg'

-- DECOMPILER ERROR at PC333: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC337: Overwrote pending register: R24 in 'AssignReg'

-- DECOMPILER ERROR at PC338: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC342: Overwrote pending register: R25 in 'AssignReg'

-- DECOMPILER ERROR at PC343: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC347: Overwrote pending register: R26 in 'AssignReg'

-- DECOMPILER ERROR at PC348: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC352: Overwrote pending register: R27 in 'AssignReg'

-- DECOMPILER ERROR at PC353: Overwrote pending register: R28 in 'AssignReg'

-- DECOMPILER ERROR at PC357: Overwrote pending register: R28 in 'AssignReg'

-- DECOMPILER ERROR at PC358: Overwrote pending register: R29 in 'AssignReg'

-- DECOMPILER ERROR at PC362: Overwrote pending register: R29 in 'AssignReg'

-- DECOMPILER ERROR at PC363: Overwrote pending register: R30 in 'AssignReg'

-- DECOMPILER ERROR at PC367: Overwrote pending register: R30 in 'AssignReg'

-- DECOMPILER ERROR at PC368: Overwrote pending register: R31 in 'AssignReg'

-- DECOMPILER ERROR at PC372: Overwrote pending register: R31 in 'AssignReg'

-- DECOMPILER ERROR at PC373: Overwrote pending register: R32 in 'AssignReg'

-- DECOMPILER ERROR at PC377: Overwrote pending register: R32 in 'AssignReg'

-- DECOMPILER ERROR at PC378: Overwrote pending register: R33 in 'AssignReg'

-- DECOMPILER ERROR at PC382: Overwrote pending register: R33 in 'AssignReg'

-- DECOMPILER ERROR at PC383: Overwrote pending register: R34 in 'AssignReg'

-- DECOMPILER ERROR at PC387: Overwrote pending register: R34 in 'AssignReg'

-- DECOMPILER ERROR at PC388: Overwrote pending register: R35 in 'AssignReg'

-- DECOMPILER ERROR at PC392: Overwrote pending register: R35 in 'AssignReg'

-- DECOMPILER ERROR at PC393: Overwrote pending register: R36 in 'AssignReg'

-- DECOMPILER ERROR at PC397: Overwrote pending register: R36 in 'AssignReg'

-- DECOMPILER ERROR at PC398: Overwrote pending register: R37 in 'AssignReg'

-- DECOMPILER ERROR at PC402: Overwrote pending register: R37 in 'AssignReg'

-- DECOMPILER ERROR at PC403: Overwrote pending register: R38 in 'AssignReg'

-- DECOMPILER ERROR at PC407: Overwrote pending register: R38 in 'AssignReg'

-- DECOMPILER ERROR at PC408: Overwrote pending register: R39 in 'AssignReg'

-- DECOMPILER ERROR at PC412: Overwrote pending register: R39 in 'AssignReg'

-- DECOMPILER ERROR at PC413: Overwrote pending register: R40 in 'AssignReg'

-- DECOMPILER ERROR at PC417: Overwrote pending register: R40 in 'AssignReg'

-- DECOMPILER ERROR at PC418: Overwrote pending register: R41 in 'AssignReg'

-- DECOMPILER ERROR at PC422: Overwrote pending register: R41 in 'AssignReg'

-- DECOMPILER ERROR at PC423: Overwrote pending register: R42 in 'AssignReg'

-- DECOMPILER ERROR at PC424: Overwrote pending register: R43 in 'AssignReg'

-- DECOMPILER ERROR at PC427: Overwrote pending register: R42 in 'AssignReg'

-- DECOMPILER ERROR at PC429: Overwrote pending register: R44 in 'AssignReg'

-- DECOMPILER ERROR at PC434: Overwrote pending register: R45 in 'AssignReg'

local l_0_43 = {}
-- DECOMPILER ERROR at PC440: No list found for R43 , SetList fails

local l_0_44 = {}
-- DECOMPILER ERROR at PC442: Overwrote pending register: R45 in 'AssignReg'

-- DECOMPILER ERROR at PC443: Overwrote pending register: R46 in 'AssignReg'

-- DECOMPILER ERROR at PC445: No list found for R44 , SetList fails

local l_0_45 = {}
-- DECOMPILER ERROR at PC447: Overwrote pending register: R46 in 'AssignReg'

-- DECOMPILER ERROR at PC448: Overwrote pending register: R47 in 'AssignReg'

-- DECOMPILER ERROR at PC450: No list found for R45 , SetList fails

local l_0_46 = {}
-- DECOMPILER ERROR at PC452: Overwrote pending register: R47 in 'AssignReg'

-- DECOMPILER ERROR at PC453: Overwrote pending register: R48 in 'AssignReg'

-- DECOMPILER ERROR at PC455: No list found for R46 , SetList fails

local l_0_47 = {}
-- DECOMPILER ERROR at PC457: Overwrote pending register: R48 in 'AssignReg'

-- DECOMPILER ERROR at PC458: Overwrote pending register: R49 in 'AssignReg'

-- DECOMPILER ERROR at PC460: No list found for R47 , SetList fails

local l_0_48 = {}
-- DECOMPILER ERROR at PC462: Overwrote pending register: R49 in 'AssignReg'

-- DECOMPILER ERROR at PC463: Overwrote pending register: R50 in 'AssignReg'

-- DECOMPILER ERROR at PC465: No list found for R48 , SetList fails

local l_0_49 = {}
-- DECOMPILER ERROR at PC467: Overwrote pending register: R50 in 'AssignReg'

-- DECOMPILER ERROR at PC468: Overwrote pending register: R51 in 'AssignReg'

-- DECOMPILER ERROR at PC470: No list found for R49 , SetList fails

local l_0_50 = {}
-- DECOMPILER ERROR at PC472: Overwrote pending register: R51 in 'AssignReg'

-- DECOMPILER ERROR at PC473: Overwrote pending register: R52 in 'AssignReg'

-- DECOMPILER ERROR at PC475: No list found for R50 , SetList fails

local l_0_51 = {}
-- DECOMPILER ERROR at PC477: Overwrote pending register: R52 in 'AssignReg'

-- DECOMPILER ERROR at PC478: Overwrote pending register: R53 in 'AssignReg'

-- DECOMPILER ERROR at PC480: No list found for R51 , SetList fails

-- DECOMPILER ERROR at PC482: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC483: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC490: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC491: Overwrote pending register: R10 in 'AssignReg'

if l_0_8 ~= 1 or l_0_4 then
  for l_0_12,l_0_13 in l_0_9 do
    -- DECOMPILER ERROR at PC494: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC495: Overwrote pending register: R14 in 'AssignReg'

  end
else
  -- DECOMPILER ERROR at PC500: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC501: Overwrote pending register: R10 in 'AssignReg'

  for i_1,i_2 in l_0_9(l_0_10) do
    -- DECOMPILER ERROR at PC504: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC505: Overwrote pending register: R14 in 'AssignReg'

  end
end
-- DECOMPILER ERROR at PC512: Overwrote pending register: R12 in 'AssignReg'

if next(i_1) == nil then
  return mp.CLEAN
end
for l_0_14,l_0_15 in ipairs(l_0_5) do
  -- DECOMPILER ERROR at PC523: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC524: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC525: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC526: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC527: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC528: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC529: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC530: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC537: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC538: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC539: Confused about usage of register: R10 in 'UnsetPending'

  -- DECOMPILER ERROR at PC539: Confused about usage of register: R10 in 'UnsetPending'

end
if not l_0_19 or l_0_20 ~= true or 0 + l_0_17 < l_0_3 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC577: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC579: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC597: Overwrote pending register: R11 in 'AssignReg'

if ((mp.get_mpattribute)("MpIsAiNetPromptScan") and not (mp.get_mpattribute)("MpIsAiMcpAmsiScan")) or (mp.get_mpattribute)("MpIsAiMcpODRScan") then
  do
    for l_0_16,l_0_17 in pairs({type = "MpIsAiNetPromptScan", frameworkId = (mp.get_contextdata)(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK), type = "MpIsAiMcpAmsiScan"}) do
      -- DECOMPILER ERROR at PC603: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC604: Overwrote pending register: R18 in 'AssignReg'

      -- DECOMPILER ERROR at PC605: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC606: Overwrote pending register: R20 in 'AssignReg'

      -- DECOMPILER ERROR at PC607: Overwrote pending register: R21 in 'AssignReg'

      -- DECOMPILER ERROR at PC608: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC610: Overwrote pending register: R19 in 'AssignReg'

      -- DECOMPILER ERROR at PC611: Confused about usage of register: R12 in 'UnsetPending'

      -- DECOMPILER ERROR at PC611: Confused about usage of register: R12 in 'UnsetPending'

    end
    -- DECOMPILER ERROR at PC616: Confused about usage of register: R9 in 'UnsetPending'

    -- DECOMPILER ERROR at PC625: Confused about usage of register: R10 in 'UnsetPending'

    -- DECOMPILER ERROR at PC626: Overwrote pending register: R16 in 'AssignReg'

    -- DECOMPILER ERROR at PC630: Confused about usage of register: R10 in 'UnsetPending'

    -- DECOMPILER ERROR at PC635: Confused about usage of register: R12 in 'UnsetPending'

    -- DECOMPILER ERROR at PC648: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC672: Overwrote pending register: R18 in 'AssignReg'

    -- DECOMPILER ERROR at PC673: Overwrote pending register: R19 in 'AssignReg'

    if (MpCommon.IsSampled)(1000, true, true, l_0_18) ~= false or (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) then
      (MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), l_0_18, l_0_19)
    end
    -- DECOMPILER ERROR at PC677: Confused about usage of register: R13 in 'UnsetPending'

    ;
    (mp.SetDetectionString)({score = tostring(0 + l_0_17), threshold = tostring(l_0_3), matched = (table.concat)({}, l_0_16), count = tostring(#{}), scaninfo = (table.concat)({}, ","), ostype = l_0_8 or 0, buffer = (MpCommon.Base64Encode)(tostring(l_0_2))})
    do return mp.INFECTED end
    -- DECOMPILER ERROR at PC682: Confused about usage of register R17 for local variables in 'ReleaseLocals'

    -- WARNING: undefined locals caused missing assignments!
  end
end

