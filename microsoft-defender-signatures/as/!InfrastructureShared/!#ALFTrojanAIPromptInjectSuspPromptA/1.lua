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
local l_0_3 = (string.lower)(l_0_2)
local l_0_4 = (string.match)(l_0_2, "\"hook_event_name\"%s*:%s*\"([%a_]+)\"")
local l_0_5 = (string.match)(l_0_2, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")
if l_0_4 ~= nil or l_0_5 ~= nil then
  if l_0_4 == "Stop" then
    return mp.CLEAN
  end
  if (string.find)(l_0_3, "last_assistant_message", 1, true) then
    return mp.CLEAN
  end
  if l_0_5 ~= nil then
    local l_0_6 = (string.lower)(l_0_5)
    if l_0_6 == "web_fetch" or l_0_6 == "web_search" or l_0_6 == "webfetch" or l_0_6 == "websearch" or l_0_6 == "view" or l_0_6 == "grep" or l_0_6 == "write" or l_0_6 == "edit" then
      return mp.CLEAN
    end
  end
end
do
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC96: No list found for R6 , SetList fails

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R8 in 'AssignReg'

  for l_0_11,l_0_12 in ("!#scpt:")("[genlast name=") do
    -- DECOMPILER ERROR at PC101: Overwrote pending register: R12 in 'AssignReg'

    if (("mavsigs").find)(l_0_3, l_0_12, 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_13 = {}
  -- DECOMPILER ERROR at PC137: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC138: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC139: Overwrote pending register: R9 in 'AssignReg'

  for l_0_17,l_0_18 in ("security testing")("penetration test") do
    -- DECOMPILER ERROR at PC142: Overwrote pending register: R13 in 'AssignReg'

    -- DECOMPILER ERROR at PC144: Overwrote pending register: R14 in 'AssignReg'

    -- DECOMPILER ERROR at PC145: Overwrote pending register: R15 in 'AssignReg'

    -- DECOMPILER ERROR at PC146: Overwrote pending register: R16 in 'AssignReg'

    if (("unit test").find)("test fixture", "cis benchmark", "hardening guide", true) then
      return mp.CLEAN
    end
  end
  local l_0_19 = 150
  local l_0_20 = 60
  local l_0_21 = 90
  local l_0_22 = 2
  local l_0_23 = false
  local l_0_24 = {}
  local l_0_25 = {}
  -- DECOMPILER ERROR at PC166: No list found for R14 , SetList fails

  local l_0_26 = {}
  -- DECOMPILER ERROR at PC168: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC169: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC170: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC171: No list found for R15 , SetList fails

  local l_0_27 = {}
  -- DECOMPILER ERROR at PC173: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC174: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC175: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC176: No list found for R16 , SetList fails

  local l_0_28 = {}
  -- DECOMPILER ERROR at PC178: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC179: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC180: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC181: No list found for R17 , SetList fails

  local l_0_29 = {}
  -- DECOMPILER ERROR at PC183: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC184: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC185: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC186: No list found for R18 , SetList fails

  local l_0_30 = {}
  -- DECOMPILER ERROR at PC188: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC189: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC190: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC191: No list found for R19 , SetList fails

  local l_0_31 = {}
  -- DECOMPILER ERROR at PC193: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC194: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC195: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC196: No list found for R20 , SetList fails

  local l_0_32 = {}
  -- DECOMPILER ERROR at PC198: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC199: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC200: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC201: No list found for R21 , SetList fails

  local l_0_33 = {}
  -- DECOMPILER ERROR at PC203: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC204: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC205: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC206: No list found for R22 , SetList fails

  -- DECOMPILER ERROR at PC207: No list found for R13 , SetList fails

  -- DECOMPILER ERROR at PC215: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC216: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC220: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC221: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC225: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC226: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC230: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC231: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC235: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC236: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC237: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC240: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC242: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC247: Overwrote pending register: R25 in 'AssignReg'

  local l_0_34 = {}
  -- DECOMPILER ERROR at PC252: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC253: No list found for R23 , SetList fails

  local l_0_35 = {}
  -- DECOMPILER ERROR at PC255: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC256: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC257: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC258: No list found for R24 , SetList fails

  local l_0_36 = {}
  -- DECOMPILER ERROR at PC260: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC261: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC262: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC263: No list found for R25 , SetList fails

  local l_0_37 = {}
  -- DECOMPILER ERROR at PC265: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC266: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC268: No list found for R26 , SetList fails

  local l_0_38 = {}
  -- DECOMPILER ERROR at PC270: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC271: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC273: No list found for R27 , SetList fails

  local l_0_39 = {}
  -- DECOMPILER ERROR at PC275: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC276: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC278: No list found for R28 , SetList fails

  local l_0_40 = {}
  -- DECOMPILER ERROR at PC280: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC281: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC283: No list found for R29 , SetList fails

  local l_0_41 = {}
  -- DECOMPILER ERROR at PC285: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC286: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC288: No list found for R30 , SetList fails

  local l_0_42 = {}
  -- DECOMPILER ERROR at PC290: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC291: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC293: No list found for R31 , SetList fails

  local l_0_43 = {}
  -- DECOMPILER ERROR at PC295: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC296: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC298: No list found for R32 , SetList fails

  local l_0_44 = {}
  -- DECOMPILER ERROR at PC300: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC301: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC303: No list found for R33 , SetList fails

  local l_0_45 = {}
  -- DECOMPILER ERROR at PC305: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC306: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC308: No list found for R34 , SetList fails

  local l_0_46 = {}
  -- DECOMPILER ERROR at PC310: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC311: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC313: No list found for R35 , SetList fails

  local l_0_47 = {}
  -- DECOMPILER ERROR at PC315: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC316: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC318: No list found for R36 , SetList fails

  local l_0_48 = {}
  -- DECOMPILER ERROR at PC320: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC321: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC323: No list found for R37 , SetList fails

  local l_0_49 = {}
  -- DECOMPILER ERROR at PC325: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC326: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC328: No list found for R38 , SetList fails

  local l_0_50 = {}
  -- DECOMPILER ERROR at PC330: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC331: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC333: No list found for R39 , SetList fails

  local l_0_51 = {}
  -- DECOMPILER ERROR at PC335: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC336: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC338: No list found for R40 , SetList fails

  local l_0_52 = {}
  -- DECOMPILER ERROR at PC340: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC341: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC343: No list found for R41 , SetList fails

  local l_0_53 = {}
  -- DECOMPILER ERROR at PC345: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC346: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC348: No list found for R42 , SetList fails

  local l_0_54 = {}
  -- DECOMPILER ERROR at PC350: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC351: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC353: No list found for R43 , SetList fails

  local l_0_55 = {}
  -- DECOMPILER ERROR at PC355: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC356: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC358: No list found for R44 , SetList fails

  local l_0_56 = {}
  -- DECOMPILER ERROR at PC360: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC361: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC363: No list found for R45 , SetList fails

  local l_0_57 = {}
  -- DECOMPILER ERROR at PC365: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC366: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC368: No list found for R46 , SetList fails

  local l_0_58 = {}
  -- DECOMPILER ERROR at PC370: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC371: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC373: No list found for R47 , SetList fails

  local l_0_59 = {}
  -- DECOMPILER ERROR at PC375: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC376: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC378: No list found for R48 , SetList fails

  local l_0_60 = {}
  -- DECOMPILER ERROR at PC380: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC381: Overwrote pending register: R51 in 'AssignReg'

  -- DECOMPILER ERROR at PC383: No list found for R49 , SetList fails

  local l_0_61 = {}
  -- DECOMPILER ERROR at PC385: Overwrote pending register: R51 in 'AssignReg'

  -- DECOMPILER ERROR at PC386: Overwrote pending register: R52 in 'AssignReg'

  -- DECOMPILER ERROR at PC388: No list found for R50 , SetList fails

  -- DECOMPILER ERROR at PC392: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC393: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC394: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC397: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC398: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC399: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC402: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC403: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC404: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC407: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC408: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC409: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC412: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC413: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC417: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC418: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC422: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC423: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC427: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC428: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC432: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC433: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC437: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC438: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC442: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC443: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC447: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC448: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC452: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC453: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC457: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC458: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC462: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC463: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC467: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC468: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC472: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC473: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC477: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC478: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC482: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC483: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC487: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC488: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC492: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC493: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC497: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC498: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC502: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC503: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC507: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC508: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC512: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC513: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC517: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC518: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC522: Overwrote pending register: R43 in 'AssignReg'

  -- DECOMPILER ERROR at PC523: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC527: Overwrote pending register: R44 in 'AssignReg'

  -- DECOMPILER ERROR at PC528: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC532: Overwrote pending register: R45 in 'AssignReg'

  -- DECOMPILER ERROR at PC533: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC537: Overwrote pending register: R46 in 'AssignReg'

  -- DECOMPILER ERROR at PC538: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC542: Overwrote pending register: R47 in 'AssignReg'

  -- DECOMPILER ERROR at PC543: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC547: Overwrote pending register: R48 in 'AssignReg'

  -- DECOMPILER ERROR at PC548: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC552: Overwrote pending register: R49 in 'AssignReg'

  -- DECOMPILER ERROR at PC553: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC554: Overwrote pending register: R51 in 'AssignReg'

  -- DECOMPILER ERROR at PC557: Overwrote pending register: R50 in 'AssignReg'

  -- DECOMPILER ERROR at PC559: Overwrote pending register: R52 in 'AssignReg'

  -- DECOMPILER ERROR at PC564: Overwrote pending register: R53 in 'AssignReg'

  local l_0_62 = {}
  -- DECOMPILER ERROR at PC570: No list found for R51 , SetList fails

  local l_0_63 = {}
  -- DECOMPILER ERROR at PC572: Overwrote pending register: R53 in 'AssignReg'

  -- DECOMPILER ERROR at PC573: Overwrote pending register: R54 in 'AssignReg'

  -- DECOMPILER ERROR at PC575: No list found for R52 , SetList fails

  local l_0_64 = {}
  -- DECOMPILER ERROR at PC577: Overwrote pending register: R54 in 'AssignReg'

  -- DECOMPILER ERROR at PC578: Overwrote pending register: R55 in 'AssignReg'

  -- DECOMPILER ERROR at PC580: No list found for R53 , SetList fails

  local l_0_65 = {}
  -- DECOMPILER ERROR at PC582: Overwrote pending register: R55 in 'AssignReg'

  -- DECOMPILER ERROR at PC583: Overwrote pending register: R56 in 'AssignReg'

  -- DECOMPILER ERROR at PC585: No list found for R54 , SetList fails

  local l_0_66 = {}
  -- DECOMPILER ERROR at PC587: Overwrote pending register: R56 in 'AssignReg'

  -- DECOMPILER ERROR at PC588: Overwrote pending register: R57 in 'AssignReg'

  -- DECOMPILER ERROR at PC590: No list found for R55 , SetList fails

  local l_0_67 = {}
  -- DECOMPILER ERROR at PC592: Overwrote pending register: R57 in 'AssignReg'

  -- DECOMPILER ERROR at PC593: Overwrote pending register: R58 in 'AssignReg'

  -- DECOMPILER ERROR at PC595: No list found for R56 , SetList fails

  local l_0_68 = {}
  -- DECOMPILER ERROR at PC597: Overwrote pending register: R58 in 'AssignReg'

  -- DECOMPILER ERROR at PC598: Overwrote pending register: R59 in 'AssignReg'

  -- DECOMPILER ERROR at PC600: No list found for R57 , SetList fails

  local l_0_69 = {}
  -- DECOMPILER ERROR at PC602: Overwrote pending register: R59 in 'AssignReg'

  -- DECOMPILER ERROR at PC603: Overwrote pending register: R60 in 'AssignReg'

  -- DECOMPILER ERROR at PC605: No list found for R58 , SetList fails

  local l_0_70 = {}
  -- DECOMPILER ERROR at PC607: Overwrote pending register: R60 in 'AssignReg'

  -- DECOMPILER ERROR at PC608: Overwrote pending register: R61 in 'AssignReg'

  -- DECOMPILER ERROR at PC610: No list found for R59 , SetList fails

  -- DECOMPILER ERROR at PC612: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC613: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC620: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC621: Overwrote pending register: R18 in 'AssignReg'

  if l_0_27 ~= 1 or l_0_23 then
    for l_0_31,l_0_32 in l_0_28 do
      -- DECOMPILER ERROR at PC624: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC625: Overwrote pending register: R22 in 'AssignReg'

    end
  else
    -- DECOMPILER ERROR at PC630: Overwrote pending register: R17 in 'AssignReg'

    -- DECOMPILER ERROR at PC631: Overwrote pending register: R18 in 'AssignReg'

    for i_1,i_2 in l_0_28(l_0_29) do
      -- DECOMPILER ERROR at PC634: Overwrote pending register: R22 in 'AssignReg'

      -- DECOMPILER ERROR at PC635: Overwrote pending register: R22 in 'AssignReg'

    end
  end
  if next(l_0_24) == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC650: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC651: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC652: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC653: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC654: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC655: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC656: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC668: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC669: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC670: Overwrote pending register: R31 in 'AssignReg'

  for l_0_44,l_0_45 in l_0_41 do
    -- DECOMPILER ERROR at PC673: Overwrote pending register: R35 in 'AssignReg'

    -- DECOMPILER ERROR at PC674: Overwrote pending register: R36 in 'AssignReg'

    -- DECOMPILER ERROR at PC675: Overwrote pending register: R37 in 'AssignReg'

    -- DECOMPILER ERROR at PC676: Overwrote pending register: R38 in 'AssignReg'

    -- DECOMPILER ERROR at PC677: Overwrote pending register: R39 in 'AssignReg'

    -- DECOMPILER ERROR at PC678: Overwrote pending register: R39 in 'AssignReg'

    -- DECOMPILER ERROR at PC679: Overwrote pending register: R40 in 'AssignReg'

    -- DECOMPILER ERROR at PC680: Overwrote pending register: R41 in 'AssignReg'

    -- DECOMPILER ERROR at PC686: Overwrote pending register: R40 in 'AssignReg'

    -- DECOMPILER ERROR at PC687: Overwrote pending register: R41 in 'AssignReg'

    -- DECOMPILER ERROR at PC691: Overwrote pending register: R29 in 'AssignReg'

    -- DECOMPILER ERROR at PC692: Overwrote pending register: R41 in 'AssignReg'

    -- DECOMPILER ERROR at PC695: Overwrote pending register: R41 in 'AssignReg'

  end
  -- DECOMPILER ERROR at PC703: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC704: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC705: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC706: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC707: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC708: Overwrote pending register: R36 in 'AssignReg'

  if (l_0_40 < l_0_47 and l_0_52) or l_0_52 < l_0_47 then
    for l_0_47,l_0_48 in ipairs({l_0_42, l_0_43, l_0_44, l_0_45, l_0_46, l_0_47}) do
      -- DECOMPILER ERROR at PC716: Overwrote pending register: R38 in 'AssignReg'

      -- DECOMPILER ERROR at PC717: Overwrote pending register: R39 in 'AssignReg'

      -- DECOMPILER ERROR at PC718: Overwrote pending register: R39 in 'AssignReg'

      -- DECOMPILER ERROR at PC719: Overwrote pending register: R40 in 'AssignReg'

      -- DECOMPILER ERROR at PC720: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC727: Overwrote pending register: R32 in 'AssignReg'

      if l_0_49 and l_0_50 == true then
        break
      end
    end
    -- DECOMPILER ERROR at PC746: Overwrote pending register: R36 in 'AssignReg'

    -- DECOMPILER ERROR at PC747: Overwrote pending register: R37 in 'AssignReg'

    if l_0_38.PromptInjection or not true or 0 ~= 6 or 0 < l_0_20 then
      for l_0_50,l_0_51 in l_0_47(l_0_48) do
        -- DECOMPILER ERROR at PC751: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC752: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC753: Confused about usage of register: R34 in 'UnsetPending'

        -- DECOMPILER ERROR at PC753: Confused about usage of register: R34 in 'UnsetPending'

        -- DECOMPILER ERROR at PC754: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC755: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC756: Overwrote pending register: R42 in 'AssignReg'

        -- DECOMPILER ERROR at PC757: Confused about usage of register: R35 in 'UnsetPending'

        -- DECOMPILER ERROR at PC757: Confused about usage of register: R35 in 'UnsetPending'

      end
      -- DECOMPILER ERROR at PC760: Confused about usage of register: R17 in 'UnsetPending'

      -- DECOMPILER ERROR at PC799: Confused about usage of register: R34 in 'UnsetPending'

      -- DECOMPILER ERROR at PC799: Overwrote pending register: R39 in 'AssignReg'

      -- DECOMPILER ERROR at PC804: Confused about usage of register: R17 in 'UnsetPending'

      -- DECOMPILER ERROR at PC804: Overwrote pending register: R40 in 'AssignReg'

      -- DECOMPILER ERROR at PC810: Confused about usage of register: R21 in 'UnsetPending'

      -- DECOMPILER ERROR at PC818: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC821: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC822: Confused about usage of register: R35 in 'UnsetPending'

      -- DECOMPILER ERROR at PC822: Overwrote pending register: R42 in 'AssignReg'

      -- DECOMPILER ERROR at PC823: Overwrote pending register: R42 in 'AssignReg'

      -- DECOMPILER ERROR at PC824: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC825: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC826: Overwrote pending register: R45 in 'AssignReg'

      -- DECOMPILER ERROR at PC828: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC829: Confused about usage of register: R35 in 'UnsetPending'

      -- DECOMPILER ERROR at PC829: Confused about usage of register: R35 in 'UnsetPending'

      -- DECOMPILER ERROR at PC833: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC837: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC841: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC844: Overwrote pending register: R42 in 'AssignReg'

      -- DECOMPILER ERROR at PC845: Overwrote pending register: R42 in 'AssignReg'

      if (((false and not not l_0_20 <= l_0_38.PromptInjection or 0 or not l_0_38[i_2] and l_0_20 <= not l_0_38[i_1] and l_0_20 <= not l_0_38.Execution and l_0_20 <= l_0_20 <= l_0_38.CredentialAccess or 0 or 0 or 0 or 0) or not l_0_38[i_2] and l_0_21 <= l_0_21 <= l_0_51 or 0 or 0) and not l_0_19 <= 0 + l_0_51 and l_0_22 <= l_0_50) or not l_0_52 then
        return l_0_53
      end
      -- DECOMPILER ERROR at PC848: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC849: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC850: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC855: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC856: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC857: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC858: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC861: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC862: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC863: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC868: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC869: Overwrote pending register: R43 in 'AssignReg'

      -- DECOMPILER ERROR at PC870: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC876: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC877: Overwrote pending register: R45 in 'AssignReg'

      -- DECOMPILER ERROR at PC878: Overwrote pending register: R45 in 'AssignReg'

      -- DECOMPILER ERROR at PC879: Overwrote pending register: R46 in 'AssignReg'

      -- DECOMPILER ERROR at PC883: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC890: Overwrote pending register: R44 in 'AssignReg'

      -- DECOMPILER ERROR at PC894: Overwrote pending register: R47 in 'AssignReg'

      -- DECOMPILER ERROR at PC898: Overwrote pending register: R42 in 'AssignReg'

      -- DECOMPILER ERROR at PC900: Overwrote pending register: R44 in 'AssignReg'

      if (l_0_54 and not l_0_54) or l_0_54 then
        do
          for i_1,l_0_59 in l_0_55 do
            -- DECOMPILER ERROR at PC904: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC905: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC906: Overwrote pending register: R49 in 'AssignReg'

            -- DECOMPILER ERROR at PC907: Overwrote pending register: R50 in 'AssignReg'

            -- DECOMPILER ERROR at PC912: Overwrote pending register: R50 in 'AssignReg'

          end
          -- DECOMPILER ERROR at PC918: Confused about usage of register: R33 in 'UnsetPending'

          -- DECOMPILER ERROR at PC930: Confused about usage of register: R35 in 'UnsetPending'

          -- DECOMPILER ERROR at PC931: Overwrote pending register: R48 in 'AssignReg'

          -- DECOMPILER ERROR at PC938: Confused about usage of register: R34 in 'UnsetPending'

          -- DECOMPILER ERROR at PC944: Confused about usage of register: R35 in 'UnsetPending'

          -- DECOMPILER ERROR at PC994: Overwrote pending register: R49 in 'AssignReg'

          -- DECOMPILER ERROR at PC995: Overwrote pending register: R50 in 'AssignReg'

          if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) then
            (MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), l_0_60, l_0_61)
          end
          -- DECOMPILER ERROR at PC1000: Confused about usage of register: R44 in 'UnsetPending'

          ;
          (mp.SetDetectionString)({score = tostring(0 + l_0_51), threshold = tostring(l_0_19), matched = (table.concat)({}, l_0_59), categories = (table.concat)({}, ","), count = tostring(#{}), max_single = tostring(l_0_40), trigger = tostring(l_0_52), scaninfo = (table.concat)(l_0_54, ","), ostype = l_0_27 or 0, buffer = (MpCommon.Base64Encode)(tostring(l_0_2))})
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC1006: Confused about usage of register R48 for local variables in 'ReleaseLocals'

          -- WARNING: undefined locals caused missing assignments!
          -- DECOMPILER ERROR: 23 unprocessed JMP targets
        end
      end
    end
  end
end

