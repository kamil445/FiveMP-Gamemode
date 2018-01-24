package.path = package.path .. ";./gamemodes/?.lua"; 
    require("vehicles");
function OnGameModeInit()	
	CreateVehicle('tourbus', 118.6, 212.3, 107.00978851318, 109.4, 5, 10, true, 2000);
	CreateVehicle('surfer', 166.4, 222.9, 105.8, 110.6, 5, 10, true, 2000);
	CreateVehicle('paradise', 127.9, 208.8, 107.0, 112.1, 5, 10, true, 2000);
	CreateVehicle('tractor', -20.9, 15.7, 71.3, 288.2, 5, 10, true, 2000);
	CreateVehicle('ruiner', 29.0, 94.2, 78.740379333496, 290.3, 5, 10, true, 2000);
	CreateVehicle('regina', 83.5, 95.3, 78.3, 109.6, 5, 10, true, 2000);
	CreateVehicle('pcj', -12.696668624878, 4.9255924224854, 70.898498535156, 20.292724609375, 5, 10, true, 2000);
	CreateVehicle('windsor', -107.27278900146, 89.17236328125, 70.897392272949, 28.870513916016, 5, 10, true, 2000);
	CreateVehicle('blade', -136.79133605957, 74.255043029785, 70.334251403809, 121.6922454834, 5, 10, true, 2000);
	CreateVehicle('dominator', -116.64392852783, 33.334949493408, 70.5869140625, 293.62911987305, 5, 10, true, 2000);
	CreateVehicle('baller6', -0.86653935909271, 2.0119783878326, 70.941215515137, 21.777008056641, 5, 10, true, 2000);
	CreateVehicle('baller3', -4.7542481422424, 3.120753288269, 71.032920837402, 20.769958496094, 5, 10, true, 2000);
	CreateVehicle('xls', -8.6257390975952, 4.6013669967651, 71.140251159668, 20.612945556641, 5, 10, true, 2000);
	CreateVehicle('mesa', -8.5859498977661, 38.481884002686, 71.01146697998, 198.53274536133, 5, 10, true, 2000);
	CreateVehicle('fq2', -13.816647529602, 40.64070892334, 71.339408874512, 198.31549072266, 5, 10, true, 2000);
	CreateVehicle('dune2', -16.243700027466, 32.581104278564, 71.164276123047, 109.14709472656, 5, 10, true, 2000);
	CreateVehicle('mesa3', 16.914319992065, 24.428556442261, 70.40754699707, 21.890411376953, 5, 10, true, 2000);
	CreateVehicle('rebel2', 15.402633666992, -9.368145942688, 69.699188232422, 18.150329589844, 5, 10, true, 2000);
	CreateVehicle('technical', 9.0757942199707, -6.8332180976868, 69.695465087891, 20.048309326172, 5, 10, true, 2000);
	CreateVehicle('guardian', 54.972194671631, 19.806745529175, 69.870674133301, 197.83990478516, 5, 10, true, 2000);
	CreateVehicle('kalahari', 63.938568115234, 15.734225273132, 68.679016113281, 200.50520324707, 5, 10, true, 2000);
	CreateVehicle('blazer3', 55.7, 30.7, 69.7, 201.1, 5, 10, true, 2000);
	CreateVehicle('blazer', 61.2, 28.7, 69.3, 107.7, 5, 10, true, 2000);
	CreateVehicle('asea', 67.8, -32.8, 68.3, 198.3, 5, 10, true, 2000);
	
	SetSpawnPoint(-1.0, 9.0, 71.5);
	local blipspawn = CreateBlip();
	SetBlipLocationType(blipspawn, 0, 0.0, 0.0, 0.0);
	SetBlipImage(blipspawn, 40);
	SetBlipName(blipspawn, "SPAWN");
	IsPlayerAdmin = {};
	IsLoggedIn = {};
	cmds = {};
	PlayerSeconds = {};
	PlayerSecondsO = {};
	Color = {};
	DMGD = {};
	DMGR = {};
	Kills = {};
	Deaths = {};
	XP = {};
	Odwiedzin = {};
	Wiad = {};
	
	CreateTimer("CheckEachPlayer", 1000);
	CreateTimer("PrepareSaveStats", 600000);
	CreateTimer("Reklama", 30000);
	
	
	LoadSettings()
	UpTimeN = 0;
	GM = "v0.0.6 | 18.11.2016 | 10:24:00"
	return 1;
end

function OnGameModeExit()
	return 1;
end

function OnPlayerConnect(playerid)
	IsLoggedIn[playerid] = 0;
	IsPlayerAdmin[playerid] = 0;
	PlayerSeconds[playerid] = 0;
	PlayerSecondsO[playerid] = 0;
	Color[playerid] = "{ffffff}";
	DMGD[playerid] = 0;
	DMGR[playerid] = 0;
	Kills[playerid] = 0;
	Deaths[playerid] = 0;
	XP[playerid] = 0;
	Odwiedzin[playerid] = 0;
	Wiad[playerid] = 0;
	Conn = Conn + 1;
	local playername = GetPlayerName(playerid);
	
	SendMessageToAll("~w~[~y~INFO~w~] "..playername.. " (ID: ~b~"..playerid .."~w~) (IP: ~r~"..GetPlayerIp(playerid).."~w~) dołączył(a) do serwera!");
	SendMessageToPlayer(playerid, "Cześć ~b~"..playername.. " (Twoje ID: "..playerid..")~w~, witaj na Polskim Party Serwerze!");
	SendMessageToPlayer(playerid, ">>>>> Wersja Gamemoda: : "..GM);
	SendMessageToPlayer(playerid, ">>>>> dostepne komendy znajdziesz pod : ~b~ /cmd");
	SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Na serwerze jest ~p~"..GetPlayerCount().." / "..GetMaxPlayers().." ~w~graczy online.");
	print(playername.." (ID: "..playerid.. ") dolaczyl(a) do serwera.");
	SetPlayerPosition(playerid, -1.0, 9.0, 71.5);
	SetPlayerFacingAngle(playerid, 20.0);
	SetPlayerMoney(playerid, 1000);
	SetPlayerMaxTagDrawDistance(playerid, 70);
	SetPlayerRespawnTime(playerid, 4000);
	SetPlayerHealth(playerid, 100);
	SetPlayerArmour(playerid, 100);
	SetPlayerModel(playerid, 420);
	ShowBlipForPlayer(spawnblip, playerid);
	
	GivePlayerWeapon(playerid, "Pistol", 45);
	GivePlayerWeapon(playerid, "parachute", 1);
	SetPlayerVisible(playerid, true);
	
	local adm = LoadINIFile("Admins.ini");
	local autologging = ReadBoolean(adm, "Settings", "AutoLogAdmins");
	if autologging == true then
		local level = ReadString(adm, "Admins", playername);
		if level == "1" then
			IsPlayerAdmin[playerid] = 1;
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Automatycznie zalogowano jako Administrator.");
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Komendy administratora znajdziesz pod ~b~/acmd");
			CloseINIFile(adm);
			end
			CloseINIFile(adm);
	end

	local Registered = io.open("./scriptfiles/Konta/"..playername..".ini", "r")
		if not Registered  then
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Nie jesteś zarejestrowany(a)! Użyj ~r~/r ~b~[hasło]");
		else
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Jesteś zarejestrowany(a)! Użyj ~r~/l ~b~[hasło]");
		end
	return 1;
end

function OnPlayerDisconnect(playerid, reason)
	local playername = GetPlayerName(playerid);
	SendMessageToAll("~w~[~y~INFO~w~] "..playername.." (ID: ".. playerid .. ") opuścił(a) serwer ~r~(wyszedł). ~w~Grał(a) ~y~"..(math.floor(PlayerSeconds[playerid]/(60*60))%24).." ~w~Godzin, ~y~"..(math.floor(PlayerSeconds[playerid]/60)%60).." ~w~Minut, ~y~"..math.floor(PlayerSeconds[playerid]%60).." ~w~Sekund")
	print(playername.." (ID: ".. playerid .. ") opuscil serwer. Gral(a) "..(math.floor(PlayerSeconds[playerid]/(60*60))%24).." Godzin, "..(math.floor(PlayerSeconds[playerid]/60)%60).." Minut, "..math.floor(PlayerSeconds[playerid]%60).." Sekund")
	
	if IsLoggedIn[playerid] == 1 then
		SaveStats(playerid)
		IsLoggedIn[playerid] = 0
	end
    return 1;
end

function OnPlayerSpawn(playerid)
	return 1;
end

function OnPlayerDeath(playerid)
	Deaths[playerid] = Deaths[playerid] + 1
	RevivePlayer(playerid)
	return 1;
end

function OnPlayerUpdate(playerid)
	return 1;
end

function OnPlayerPickUpPickup(pickup, player)
	return 1;
end

function OnPlayerMessage(playerid, message)
	Wiad[playerid] = Wiad[playerid] + 1;
	local playername = GetPlayerName(playerid);
	if IsPlayerAdmin[playerid] == 1 then
		SendMessageToAll("~w~[~r~Admin~w~] {"..Color[playerid].."}"..playername.." ~w~(ID: "..playerid.."): "..message);
		print(playername.." (ID: "..playerid.."): "..message);
		return 1;
	end
	SendMessageToAll("~w~[~y~Gracz~w~] {"..Color[playerid].."}"..playername.." ~w~(ID: "..playerid.."): "..message);
	print(playername.." (ID: "..playerid.."): "..message);
	return 1;
end

function OnPlayerEnterVehicle(playerid, vehicleid, seatid)
	if (seatid == 0) then
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Możesz naprawić swój pojazd wpisując ~r~/repair")
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Możesz również zamknąć pojazd ~r~/lock ~w~oraz otworzyć ~r~/unlock")
		return 1;
	end
	return 1;
end

function OnPlayerExitVehicle(playerid, vehicleid, seatid)
	return 1;
end

function OnPlayerEnterCheckpoint(playerid, checkpointid)
	return 1;
end

function OnPlayerExitCheckpoint(playerid, checkpointid)
	return 1;
end

function OnPlayerEnteringVehicle(playerid, vehicleid, seatid)
	if(vehicleid == -1) then
		ShowMessageToPlayer(playerid, "~w~[~r~UWAGA~w~] Zakazane jest spawnowanie pojazdów przez trainery [~r~Ostrzeżenie 1/3~w~]")
		return 0
	end 
return 1;
end

function OnPlayerExitingVehicle(playerid, vehicleid, seatid)
	return 1;
end

function OnVehicleRespawn(vehicleid)
	return 1;
end

function OnPlayerDamage(player, damager, ammount)
	DMGD[damager] = DMGD[damager] + ammount
	DMGR[player] = DMGR[player] + ammount
	return 1;
end

function OnPlayerShotBullet(playerid, weapon)
	return 1;
end

function OnProjectileImpact(player, weapon, x, y, z, entityType, entityID, entityBone)
	return 1;
end

function OnVehicleDamage(vehicle, player, engineDamage, fuelDamage)
	return 1;
end

function OnPlayerCommand(playerid, message)
    args = {}
    index = 0
    for value in string.gmatch(message,"%S+") do
        args [index] = value
        index = index + 1
    end
   
    cmds.atp = function(playerid, sourceid, targatid)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.")
		end
		if (checkparams(sourceid, "i", targetid, "i")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/atp ~b~[id] do [id celu]")
		end
		local adminname = GetPlayerName(playerid);
		local sourcename = GetPlayerName(sourceid);
		local targetname = GetPlayerName(targetid);
			
		local x, y, z = GetPlayerPosition(targetid)
		SetPlayerPosition(sourceid, x, y, z)
			
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Teleportowałeś(aś) "..sourcename.." (ID: ".. sourceid .." do "..targetname.." (ID: "..targetid..")");
		SendMessageToPlayer(sourceid, "~w~[~y~INFO~w~]Zostałeś(aś) teleportowany(a) do ~b~"..targetname.." (ID: "..targetid..") przez Admina "..adminname.." (ID: "..playerid..").");
		SendMessageToPlayer(targetid, "~w~[~y~INFO~w~]"..targetname.." (ID: "..targetid..") został(a) teleportowany(a) do ciebie przez Admina "..adminname.." (ID: "..playerid..").");
    end
	
	cmds.tpto = function(playerid, targetid)
        if (checkparams(targetid, "i")) then
			return SendMessageToPlayer(playerid, "{ffffff}[{ff0000}BŁĄD{ffffff}]Użyj {ff0000}/tpto {0000ff}<id>");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "{ffffff}[{ff0000}BŁĄD{ffffff}]Nie odnaleziono gracza o ID: "..targetid);
		end
		targetname = GetPlayerName(targetid)
			
		local x, y, z = GetPlayerPosition(targetid)
		SetPlayerPosition(playerid, x+0.5, y, z)
		SendMessageToPlayer(playerid, "{ffffff}[{ffff00}INFO{ffffff}]Zostałeś(aś) teleportowany(a) do {0000ff}" .. targetname);
    end
	
	cmds.pm = function(playerid, targetid, message)
		if (checkparams(targetid, "i", text, "a")) then
			return SendMessageToPlayer(playerid, "{ffffff}[{ff0000}BŁĄD{ffffff}]Użyj {ff0000}/pm {0000ff}<id> <treść>");
		end
		function PrivateMessage(window, playerid, targetid, message)
			if not IsPlayerConnected(targetid) then
				return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie odnaleziono gracza o ID: "..targetid);
			end
			SendMessageToPlayer(targetid, "[PM] Prywatna wiadomość od "..GetPlayerName(playerid)..": "..message);
			SendMessageToPlayer(playerid, "[PM] Wiadomość została wysłana.");
			windowHide(window, playerid);
			windowDestroy(window);
		end

		guiID = windowCreate(0.25, 0.4, 0.5, 0.33, true, "Private message", true);
		windowAddText(gui, "To send a private message to another player, fill out their ID and the message that you want to send.");
		windowAddText(gui, "ID Gracza: ");
		windowSameLine(gui);
		windowAddInputField(gui, 0.5, false);
		windowNewLine(gui);
		windowAddText(gui, "Wiadomość: ");
		windowSameLine(gui);
		windowAddInputField(gui, 0.7, false);
		windowNewLine(gui);
		windowAddButton(gui, 0.3, "Send message", "PrivateMessage", false);
		windowSameLine(gui);
		windowAddButton(gui, 0.3, "Anuluj", "", true);
		windowSetOpacity(gui, 0.50);
		windowShow(gui, playerid);
	end
	
	cmds.weapon = function(playerid, weapid)
		if (checkparams(weapid, "s")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD]~w~Użyj /weapon [nazwa broni]");
		end
		GivePlayerWeapon(playerid, weapid, 500);
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Otrzymaleś(aś) broń ~r~: "..weapid);
    end
	
	cmds.ramp = function(playerid);
		local x, y, z = GetPlayerPosition(playerid)
        local id = CreateObject("prop_mp_ramp_01", x, y, z+0.5, 0, 0, 85);
    end
	
	cmds.skin = function(playerid, skinid);
		if (checkparams(skinid, "i")) then
		return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD]~w~Użyj ~r~/skin ~b~[id 0-698]");
		end
		if skinid < 0 or skinid > 689 then
			SendMessageToPlayer(playerid,"~w~[~r~BŁĄD]~w~ID skina nie może być ~r~mniejsze~w~ niż 0 oraz ~r~większe~w~ niż 689.");
			return 1;
		end
		SetPlayerModel(playerid, skinid);
    end
	
	cmds.skinid = function(playerid);
		skinid = GetPlayerModel(playerid);
		SendMessageToPlayer(playerid,"~w~[~y~INFO~w~]ID twojego aktualnego skina to: "..skinid);
    end
	
	cmds.spawn = function(playerid);
		SendMessageToPlayer(playerid,"~w~[~y~INFO~w~]Zostałeś(aś) teleportowany(a) na ~r~spawn!");
        SetPlayerPosition(playerid, -3.73, 18.03, 72);
    end
	
	cmds.cmd = function(playerid);
		SendMessageToPlayer(playerid,"~w~[~y~CMD~w~][~r~1/2]~w~ >>>>>>>> Komendy ~b~dostepne ~w~na serwerze to:");
		SendMessageToPlayer(playerid,"~b~/~o~spawn ~w~- ~y~Teleportuje cię na spawn [Teleporting you to spawn]");
		SendMessageToPlayer(playerid,"~b~/~o~v ~g~[nazwa pojazdu] ~w~- ~y~Tworzy pojazd [Create vehicle]");
		SendMessageToPlayer(playerid,"~b~/~o~czysc ~w~- ~y~Czyścisz sobie czat [Clear your chat]");
		SendMessageToPlayer(playerid,"~b~/~o~ramp ~w~- ~y~Tworzy rampę [Creating ramp for you]");
		SendMessageToPlayer(playerid,"~b~/~o~weapon ~g~[nazwa] ~w~- ~y~Daje wybraną broń [Give you inputed weapon]");
		SendMessageToPlayer(playerid,"~b~/~o~tpto ~g~[ID] ~w~- ~y~Teleportuje cię do gracza [Teleport you to player]");
		SendMessageToPlayer(playerid,"~b~/~o~skinid ~w~- ~y~ Wyświetla ID twojego skina [Show you SkinID]");
		SendMessageToPlayer(playerid,"~b~/~o~skin ~g~[ID] ~w~- ~y~Zmienia twojego skina [Change your skin]");
		SendMessageToPlayer(playerid,"~b~/~o~pm ~g~[ID] ~g~[TREŚĆ] ~w~- ~y~Wysyła pryw. wiad. do gracza [Send PW to player]");
		SendMessageToPlayer(playerid,"~b~/~o~players ~w~- ~y~Pokazuje listę Online [Show Online list]");
		SendMessageToPlayer(playerid,"~b~/~o~plate ~g~[TREŚĆ] ~w~- ~y~Zmienia rejestracje wozu [Change vehicle plates]");
		SendMessageToPlayer(playerid,"~b~/~o~zw ~w~- ~y~Informuje graczy że jesteś AFK [Say to all you are AFK]");
		SendMessageToPlayer(playerid,"~b~/~o~jj ~w~- ~y~Informuje graczy że wróciłeś AFK [Say to all you are non-AFK]");
		SendMessageToPlayer(playerid,"~b~/~o~color ~g~[KOLOR] ~w~- ~y~zmienia twój kolor nicku [Change your nickname color]");
		SendMessageToPlayer(playerid,"~b~/~o~stats ~g~[NICK] ~w~- ~y~Sprawdza twoje/gracza statystyki! [Show you/player statistics]");
		SendMessageToPlayer(playerid,"~b~/~o~r ~g~[HASŁO] ~w~- ~y~Tworzy twoje konto na serwerze [Create your Account]");
		SendMessageToPlayer(playerid,"~w~[~y~CMD~w~][~r~1/2~w~] >>> Dalsza część komend pod ~b~/~r~cmd1");
    end
	
	cmds.cmd1 = function(playerid);
		SendMessageToPlayer(playerid,"~w~[~y~CMD~w~][~r~2/2]~w~ >>>>>>>> Komendy ~b~dostepne ~w~na serwerze to:");
		SendMessageToPlayer(playerid,"~b~/~o~l ~g~[HASŁO] ~w~- ~y~Loguje cię [Logging you]");
		SendMessageToPlayer(playerid,"~b~/~o~repair ~w~- ~y~Naprawia twój pojazd [Repair your vehicle]");
		SendMessageToPlayer(playerid,"~b~/~o~session ~w~- ~y~Pokazuje staty od wejścia na serwer [Show actually session stats]");
		SendMessageToPlayer(playerid,"~b~/~o~lock ~w~- ~y~Zamykasz swój pojazd! [Locking you vehicle doors]");
		SendMessageToPlayer(playerid,"~b~/~o~unlock ~w~- ~y~Otwierasz swój pojazd! [Unlocking you vehicle doors]");
		SendMessageToPlayer(playerid,"~b~/~o~serverstats ~w~- ~y~Wyświetla statystyki serwera. [Show server stats]");
		SendMessageToPlayer(playerid,"~b~/~o~ping ~w~- ~y~Wyświetla twój ping. [Show your ping]");
		SendMessageToPlayer(playerid,"~w~[~y~CMD~w~][~r~2/2~w~] >>> Jak na razie to tyle ;)");
    end
	
	cmds.acmd = function(playerid);
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		SendMessageToPlayer(playerid,"/alogin");
		SendMessageToPlayer(playerid,"/awyloguj");
		SendMessageToPlayer(playerid,"/adajadma");
		SendMessageToPlayer(playerid,"/awezadma");
		SendMessageToPlayer(playerid,"/agivegun");
		SendMessageToPlayer(playerid,"/atp");
		SendMessageToPlayer(playerid,"/asvall");
		SendMessageToPlayer(playerid,"/asetname");
	end
	
	cmds.czysc = function(playerid);
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
		SendMessageToPlayer(playerid,"");
    end
	
	cmds.v = function(playerid);
		if IsPlayerInAnyVehicle(playerid) then
			local destroyveh = GetPlayerVehicleID(playerid)
			RemoveVehicle(destroyveh)
		end
		function SpawnVehicle(window, playerid, vehid)
			local x,y,z = GetPlayerPosition(playerid)
			local Angle = GetPlayerFacingAngle(playerid);
			local veh = CreateVehicle(TVehicles[vehid+1], x, y, z, Angle, 5, 10, true, 500);
			PutPlayerInVehicle(playerid, veh, 0);
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Stworzyłeś(aś) pojazd: ~r~"..vehname.."~w~, ID: ~r~"..veh);
			windowHide(window, playerid);
			windowDestroy(window);
		end

		vehGuiId = windowCreate(0.1, 0.3, 0.3, 0.2, true, "Vehicles");
		windowSetOpacity(vehGuiId, 0.5);
		windowAddText(vehGuiId, "Wybierz pojazd");
		--windowAddList(vehGuiId, false, table.concat(TVehicles, ",")); // Another way but bad for the gui fps
		windowAddCombo(vehGuiId, 0.9, table.concat(TVehicles, ","));
		windowAddButton(vehGuiId, 0.3, "Spawn", "SpawnVehicle", true);
		windowSameLine(vehGuiId);
		windowAddButton(vehGuiId, 0.3, "Zamknij");
		windowShow(vehGuiId, playerid);
		
    end
	
	cmds.alogin = function(playerid, password)
		if IsPlayerAdmin[playerid] == 1 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Jesteś już zalogowany(a) jako Administrator");
		end
		if (checkparams(password, "s")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/alogin ~b~[hasło]");
		end
		adm = LoadINIFile("Admins.ini");
		pass = ReadString(adm, "Settings", "Password");
		if pass == password then
			playername = GetPlayerName(playerid);
			level = ReadString(adm, "Admins", playername);
				if level == "1" then
				IsPlayerAdmin[playerid] = 1;
				SendMessageToPlayer(playerid, "Pomyslnie zalogowano jako Administrator");
				return 1;
			end
			SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Brak uprawnien");
			return 1;
		end
		SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Błędne hasło! Sprubój ponownie...");
		CloseINIFile(adm);
	end
	
	cmds.azaloguj = function(playerid, targetid)
		targetname = GetPlayerName(targetid);
		playername = GetPlayerName(playerid);
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		if (checkparams(targetid, "i")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~] Użyj ~r~/azaloguj ~b~[ID]");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]ID '"..targetid.."' nie ma serwerze.");
		end
		if IsPlayerAdmin[targetid] == 1 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Podane ID jest już Administratorem.");
		end
		IsPlayerAdmin[targetid] = 1;
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Zalogowałeś(aś)"..targetname.." (ID: "..targetid..") na Administratora do wylogowania.");
		SendMessageToPlayer(targetid, "~w~[~y~INFO~w~]Zostałeś(aś) zalogowany(a) jako administrator przez "..playername.." (ID: "..targetid..") do wylogowania.");
	end
	
	cmds.adajadma = function(playerid, targetid)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		adm = LoadINIFile("Admins.ini");
		canaddadmin = ReadBoolean(adm, "Settings", "AllowManageAdminsInGame");
		if canaddadmin == false then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Zarządzanie administratorami przez gre jest obecnie wyłączone.");
		end
		CloseINIFile(adm);
		if (checkparams(targetid, "i")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/adajadma ~b~[ID]");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~] ID '"..targetid.."' nie ma serwerze.");
		end
		targetname = GetPlayerName(targetid);
		adm = LoadINIFile("Admins.ini");
		level = ReadString(adm, "Admins", targetname);
		if level == "1" then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~] "..targetname.." (ID: "..targetid..") Jest już zapisany jako Administrator");
		end
		WriteString(adm, "Admins", targetname, "1");
		IsPlayerAdmin[targetid] = 1;
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Dodałeś(aś) Administratora "..targetname.." (ID: "..targetid..").");
		CloseINIFile(adm);
	end
	
	cmds.awezadma = function(playerid, targetid)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		adm = LoadINIFile("Admins.ini");
		canaddadmin = ReadBoolean(adm, "Settings", "AllowManageAdminsInGame");
		if canaddadmin == false then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Zarządzanie administratorami przez gre jest obecnie wyłączone.");
		end
		CloseINIFile(adm);
		if (checkparams(targetid, "i")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/adajadma ~b~[ID]");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]ID '"..targetid.."' nie ma na serwerze.");
		end
		targetname = GetPlayerName(targetid);
		adm = LoadINIFile("Admins.ini");
		level = ReadString(adm, "Admins", targetname);
		if level == "0" or level == nil then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~] "..targetname.." (ID: "..targetid..") nie jest zapisanym Administratorem.");
		end
		WriteString(adm, "Admins", targetname, "0");
		IsPlayerAdmin[targetid] = 0;
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Zabrałeś(aś) Administratora "..targetname.." (ID: "..targetid..").");
		CloseINIFile(adm);
	end
	
	cmds.awyloguj = function(playerid, targetid)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		if (checkparams(targetid, "i")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/awyloguj ~b~[ID]");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]ID '"..targetid.."' nie ma na serwerze.");
		end
		if IsPlayerAdmin[targetid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Podane ID nie jest Administratorem.");
		end
		targetname = GetPlayerName(targetid);
		playername = GetPlayerName(playerid);
		IsPlayerAdmin[targetid] = 0;
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Wylogowałeś(aś)"..targetname.." (ID: "..targetid..") z Administratora.");
		SendMessageToPlayer(targetid, "~w~[~y~INFO~w~]Zostałeś(aś) wylogowany(a) z administratora przez "..playername.." (ID: "..targetid..")");
	end
	
	cmds.agivegun = function(playerid, targetid, weaponname, ammo)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		if (checkparams(targetid, "i", weaponname, "s", ammo, "i")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj /agivegun [id] [nazwa broni] [ammo]");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]ID '"..targetid.."' nie ma na serwerze.");
		end
		targetname = GetPlayerName(targetid);
		playername = GetPlayerName(playerid);
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Dałeś(aś) broń  "..weaponname.." graczowi "..targetname.." (ID: "..targetid..") oraz "..ammo.." szt. amunicji.");
		SendMessageToPlayer(targetid, "~w~[~y~INFO~w~]Otrzymałeś(aś) broń  "..weaponname.." od Admina "..playername.." (ID: "..playerid..") oraz "..ammo.." szt. amunicji.");
		GivePlayerWeapon(playerid, weaponname, ammo);
	end
	
	cmds.asvall = function(playerid)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.")
		end
		PrepareSaveStats()
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Wymusiłeś(aś) Auto Zapis statystyk.")
	end
	
	cmds.asetname = function(playerid, targetid, newname)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		if (checkparams(targetid, "i", newname, "a")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj /asetname [id] [nick]");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]ID '"..targetid.."' nie ma na serwerze.");
		end
		targetname = GetPlayerName(targetid);
		playername = GetPlayerName(playerid);
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Zmieniłeś(aś) nick "..targetname.." (ID: "..targetid..") na "..newname);
		SendMessageToPlayer(targetid, "~w~[~y~INFO~w~]Admin "..playername.." (ID: "..playerid..") zmienił(a) twój nick na "..newname);
		SetPlayerName(targetid, newname)
	end
	
	cmds.stop = function(playerid)
		if IsPlayerAdmin[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie posiadasz wymaganych uprawnień do użycia tej komendy.");
		end
		Shutdown()
	end
	----------------------------------------------------------------------------------------------------------------------------------
	cmds.players = function(playerid)
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Aktualnie na serwerze jest ~p~"..GetPlayerCount().." / "..GetMaxPlayers().." ~w~ online:")
		for i = 0,GetPlayerPoolSize() do
			if IsPlayerConnected(i) then
				name = GetPlayerName(i)
				if IsPlayerAdmin[i] == 1 then
					SendMessageToPlayer(playerid, "~w~[~r~Admin~w~] ~"..Color[i].."~~w~"..name.." (ID: "..i..") (IP: ~y~"..GetPlayerIp(i).."~w~) (~y~"..(math.floor(PlayerSeconds[i]/(60*60))%24).." ~w~G, ~y~"..(math.floor(PlayerSeconds[i]/60)%60).." ~w~M, ~y~"..math.floor(PlayerSeconds[i]%60).." ~w~S) ("..GetPlayerPing(i).." ms)")
					else
					SendMessageToPlayer(playerid, "~w~[~y~Gracz~w~] ~"..Color[i].."~~w~"..name.." (ID: "..i..") (IP: ~y~"..GetPlayerIp(i).."~w~) (~y~"..(math.floor(PlayerSeconds[i]/(60*60))%24).." ~w~G, ~y~"..(math.floor(PlayerSeconds[i]/60)%60).." ~w~M, ~y~"..math.floor(PlayerSeconds[i]%60).." ~w~S) ("..GetPlayerPing(i).." ms)")
				end
			end
		end
	end
	
	cmds.l = function(playerid, password)
		local playername = GetPlayerName(playerid)
		local Registered = io.open("./scriptfiles/Konta/"..playername..".ini", "r")
		if not Registered  then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś zarejestrowany! Użyj ~r~/r ~b~[hasło]");
		end
		if IsLoggedIn[playerid] == 1 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Jesteś już zalogowany(a)!");
		end
		if (checkparams(password, "a")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/l ~b~[hasło]");
		end
		local UserINI = LoadINIFile("Konta/"..playername..".ini");
		local Pass = ReadString(UserINI, "Konto", "Haslo");
		if not (Pass == password) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Błędne hasło! spróbuj ponownie.");
		end
		local x = ReadString(UserINI, "Konto", "LastPosX");
		local y = ReadString(UserINI, "Konto", "LastPosY");
		local z = ReadString(UserINI, "Konto", "LastPosZ");
		SetPlayerModel(playerid, ReadString(UserINI, "Konto", "LastSkinID"));
		Color[playerid] = ReadString(UserINI, "Konto", "ChatColor");
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Logowanie zakończone ~r~sukcesem! ~w~Teleportuję do twojej ostatniej pozycji...");
		IsLoggedIn[playerid] = 1;
		SetPlayerMoney(playerid, ReadString(UserINI, "Konto", "Money"));
		XP[playerid] = ReadString(UserINI, "Konto", "Respekt")
		Kills[playerid] = ReadString(UserINI, "Konto", "Kills")
		Deaths[playerid] = ReadString(UserINI, "Konto", "Deaths")
		DMGD[playerid] = ReadString(UserINI, "Konto", "DMG.Done")
		DMGR[playerid] = ReadString(UserINI, "Konto", "DMG.Received")
		Odwiedzin[playerid] = ReadInteger(UserINI, "Konto", "Odwiedzin") + 1;
		Wiad[playerid] = ReadString(UserINI, "Konto", "Wiad")
		SetPlayerPosition(playerid, x,y,z);
		CreateTimer("Dystrybutor", 120000, playerid)
		CloseINIFile(UserINI);
	end
	
	cmds.r = function(playerid, password)
		local playername = GetPlayerName(playerid);
		if (IsLoggedIn[playerid] == 1) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Jesteś już zalogowany(a) oraz zarejestrowany(a), rejestracja nie jest konieczna!");
		end
		local Registered = io.open("./scriptfiles/Konta/"..playername..".ini", "r")
		if Registered then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Jesteś już zarejestrowany(a)! Użyj ~r~ /l ~b~[hasło]");
		end
		if (checkparams(password, "a")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/r ~b~[hasło]");
		end
		local UserINI = LoadINIFile("Konta/"..playername..".ini");
		local x, y, z = GetPlayerPosition(playerid);
		WriteString(UserINI, "Konto", "Haslo", password);
		WriteString(UserINI, "Konto", "RegisterIP", GetPlayerIp(playerid));
		WriteString(UserINI, "Konto", "Registered", (os.date ("%x %X")));
		WriteString(UserINI, "Konto", "LastLogin", (os.date ("%x %X")));
		WriteString(UserINI, "Konto", "Money", 1500);
		WriteInteger(UserINI, "Konto", "Respekt", 0);
		WriteString(UserINI, "Konto", "LastPosX", x);
		WriteString(UserINI, "Konto", "LastPosY", y);
		WriteString(UserINI, "Konto", "LastPosZ", z);
		WriteInteger(UserINI, "Konto", "PlayedTime", 0)
		WriteString(UserINI, "Konto", "LastSkinID", 420)
		WriteString(UserINI, "Konto", "ChatColor", "white")
		WriteInteger(UserINI, "Konto", "Kills", 0)
		WriteInteger(UserINI, "Konto", "Deaths", 0)
		WriteInteger(UserINI, "Konto", "DMG.Done", 0)
		WriteInteger(UserINI, "Konto", "DMG.Received", 0)
		WriteInteger(UserINI, "Konto", "Odwiedzin", 1)
		WriteInteger(UserINI, "Konto", "Wiad", 0)
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Rejestracja zakończona pomyślnie twoje hasło to >>>: ~r~"..password)
		SetPlayerMoney(playerid, 1500)
		SetPlayerScore(playerid, 0)
		XP[playerid] = 0;
		Kills[playerid] = 0;
		Deaths[playerid] = 0;
		DMGD[playerid] = 0;
		DMGR[playerid] = 0;
		Odwiedzin[playerid] = 1;
		Wiad[playerid] = 0;
		IsLoggedIn[playerid] = 1;
		Accounts = Accounts + 1;
		CloseINIFile(UserINI)
	end
	
	cmds.plate = function(playerid, text)
		if not IsPlayerInAnyVehicle(playerid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś w żadnym pojeździe!")
		end
		
		if GetPlayerVehicleSeat(playerid) >= 1 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś kierowcą w pojeździe!")
		end
		
		if (checkparams(text, "a")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/plate ~b~[tekst]")
		end
		veh = GetPlayerVehicleID(playerid);
		SetVehicleNumberPlate(veh, text);
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Nowa rejestracja twojego wozu to>>>: ~r~"..text)
	end
	
	cmds.s = function(playerid, vehiclename)
        if (checkparams(vehiclename, "a")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/s ~b~[vehiclename]")
		end
        local file = io.open("pos.txt", "a")
        
        if IsPlayerInAnyVehicle(playerid) then
            local vehicleid = GetPlayerVehicleID(playerid)
            local x, y, z = GetPosition("VEHICLE", vehicleid)
			local Angle = GetPlayerFacingAngle(playerid);
            file:write("CreateVehicle('"..vehiclename.."', "..x..", "..y..", "..z..", "..Angle..", 5, 10, true, 2000);\n");
            SendMessageToPlayer(playerID, "~y~Saved Vehicle: ~c~"..vehiclename..", "..x..", "..y..", "..z);
        end
        io.close(file)
	end
	
	cmds.color = function(playerid, c)
        if (checkparams(c, "a")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj ~r~/color ~b~[kolor] ~w~kolory: czerwony,niebieski,pomarańczowy,żółty,różowy,zielony,biały");
		end
		if (c == "czerwony") or (c == "red") then
			Color[playerid] = "red"
		elseif (c == "niebieski") or (c == "blue") then
			Color[playerid] = "blue"
		elseif (c == "pomarańczowy") or (c == "orange") then
			Color[playerid] = "orange"
		elseif (c == "żółty") or (c == "yellow") then
			Color[playerid] = "yellow"
		elseif (c == "różowy") or (c == "pink") then
			Color[playerid] = "pink"
		elseif (c == "zielony") or (c == "green") then
			Color[playerid] = "green"
		elseif (c == "biały") or (c == "white") then
			Color[playerid] = "white"
		else SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Kolory: czerwony,niebieski,pomarańczowy,żółty,różowy,zielony,biały lub po angielsku");
		end
	end
	
	cmds.repair = function(playerid)
		if not IsPlayerInAnyVehicle(playerid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś w żadnym pojeździe!");
		end
		
		if GetPlayerVehicleSeat(playerid) >= 1 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś kierowcą w pojeździe!");
		end
		local veh = GetPlayerVehicleID(playerid)
		SetVehicleDeformationFixed(veh)
		SetVehicleFixed(veh)
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Naprawiłeś(aś) swój pojazd!")
	end
	
	cmds.stats = function(playerid, targetname)
		if targetname == nil then
			if IsLoggedIn[playerid] == 0 then
				return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Musisz być zalogowany(a) by przejrzeć swoje statystyki!");
			end
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Twoje statystyki to:")
			local UserINI = LoadINIFile("Konta/"..GetPlayerName(playerid)..".ini");
			local TT = ReadInteger(UserINI, "Konto", "PlayedTime")		
			SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
			SendMessageToPlayer(playerid, "~b~| ~w~Data rejestracji: ~g~"..ReadString(UserINI, "Konto", "Registered"))
			SendMessageToPlayer(playerid, "~b~| ~w~Data ostatniej wizyty: ~g~Aktualnie Online")
			SendMessageToPlayer(playerid, "~b~| ~w~Pieniądze: ~g~"..GetPlayerMoney(playerid))
			SendMessageToPlayer(playerid, "~b~| ~w~Respekt: ~g~"..XP[playerid])
			SendMessageToPlayer(playerid, "~b~| ~w~SkinID: ~g~"..GetPlayerModel(playerid))
			SendMessageToPlayer(playerid, "~b~| ~w~Aktualny czas gry: ~r~"..(math.floor(PlayerSeconds[playerid]/(60*60))%24).." ~w~Godzin, ~y~"..(math.floor(PlayerSeconds[playerid]/60)%60).." ~w~Minut, ~y~"..math.floor(PlayerSeconds[playerid]%60).." ~w~Sekund")
			SendMessageToPlayer(playerid, "~b~| ~w~Łączny czas gry: ~r~"..(math.floor(TT/(60*60))%24).." ~w~Godzin, ~y~"..(math.floor(TT/60)%60).." ~w~Minut, ~y~"..math.floor(TT%60).." ~w~Sekund")
			SendMessageToPlayer(playerid, "~b~| ~w~Zabójstw: ~g~"..Kills[playerid])
			SendMessageToPlayer(playerid, "~b~| ~w~Śmierci: ~g~"..Deaths[playerid])
			SendMessageToPlayer(playerid, "~b~| ~w~Łączny Zadany DMG: ~g~"..DMGD[playerid])
			SendMessageToPlayer(playerid, "~b~| ~w~Łączny Otrzymany DMG: ~g~"..DMGR[playerid])
			SendMessageToPlayer(playerid, "~b~| ~w~Odwiedzin: ~g~"..Odwiedzin[playerid])
			SendMessageToPlayer(playerid, "~b~| ~w~Wiadomości na czacie: ~g~"..Wiad[playerid])
			SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
			CloseINIFile(UserINI)
		else
			local Registered = io.open("./scriptfiles/Konta/"..targetname..".ini", "r")
			if not Registered  then
				return SendMessageToPlayer(playerid, "~w~[~y~INFO~w~] "..targetname.." nie posiada u nas jeszcze statystyk!")
			else
				local UserINI = LoadINIFile("Konta/"..targetname..".ini");
				SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Statystyki ~y~"..targetname.."~w~:")
				local TT = ReadInteger(UserINI, "Konto", "PlayedTime")
				SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
				SendMessageToPlayer(playerid, "~b~| ~w~Data rejestracji: ~g~"..ReadString(UserINI, "Konto", "Registered"))
				SendMessageToPlayer(playerid, "~b~| ~w~Data ostatniej wizyty: ~g~"..ReadString(UserINI, "Konto", "LastLogin"))
				SendMessageToPlayer(playerid, "~b~| ~w~Pieniądze: ~g~"..ReadString(UserINI, "Konto", "Money"))
				SendMessageToPlayer(playerid, "~b~| ~w~Respekt: ~g~"..ReadString(UserINI, "Konto", "Respekt"))
				SendMessageToPlayer(playerid, "~b~| ~w~SkinID: ~g~"..ReadString(UserINI, "Konto", "LastSkinID"))
				SendMessageToPlayer(playerid, "~b~| ~w~Łączny czas gry: ~r~"..(math.floor(TT/(60*60))%24).." ~w~Godzin, ~y~"..(math.floor(TT/60)%60).." ~w~Minut, ~y~"..math.floor(TT%60).." ~w~Sekund")
				SendMessageToPlayer(playerid, "~b~| ~w~Zabójstw: ~g~"..ReadString(UserINI, "Konto", "Kills"))
				SendMessageToPlayer(playerid, "~b~| ~w~Śmierci: ~g~"..ReadString(UserINI, "Konto", "Deaths"))
				SendMessageToPlayer(playerid, "~b~| ~w~Łączny Zadany DMG: ~g~"..ReadString(UserINI, "Konto", "DMG.Done"))
				SendMessageToPlayer(playerid, "~b~| ~w~Łączny Otrzymany DMG: ~g~"..ReadString(UserINI, "Konto", "DMG.Received"))
				SendMessageToPlayer(playerid, "~b~| ~w~Odwiedzin: ~g~"..ReadString(UserINI, "Konto", "Odwiedzin"))
				SendMessageToPlayer(playerid, "~b~| ~w~Wiadomości na czacie: ~g~"..ReadString(UserINI, "Konto", "Wiad"))
				SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
				CloseINIFile(UserINI)
			end
		end
	end
	
	cmds.session = function(playerid)
		if IsLoggedIn[playerid] == 0 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Musisz być zalogowany(a) by przejrzeć statystyki sesji!");
		end
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Twoje statystyki tej sesji to:")
		SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
		SendMessageToPlayer(playerid, "~b~| ~w~ID: ~g~"..GetPlayerId(playerid))
		SendMessageToPlayer(playerid, "~b~| ~w~IP: ~g~"..GetPlayerIp(playerid))
		SendMessageToPlayer(playerid, "~b~| ~w~Ping: ~g~"..GetPlayerPing(playerid).." ms")
		SendMessageToPlayer(playerid, "~b~| ~w~Pieniądze: ~g~"..GetPlayerMoney(playerid))
		SendMessageToPlayer(playerid, "~b~| ~w~Respekt: ~g~"..XP[playerid])
		SendMessageToPlayer(playerid, "~b~| ~w~SkinID: ~g~"..GetPlayerModel(playerid))
		SendMessageToPlayer(playerid, "~b~| ~w~Czas gry: ~r~"..(math.floor(PlayerSeconds[playerid]/(60*60))%24).." ~w~Godzin, ~y~"..(math.floor(PlayerSeconds[playerid]/60)%60).." ~w~Minut, ~y~"..math.floor(PlayerSeconds[playerid]%60).." ~w~Sekund")
		SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
	end
	
	cmds.lock = function(playerid)
		if not IsPlayerInAnyVehicle(playerid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś w żadnym pojeździe!");
		end
		if GetPlayerVehicleSeat(playerid) >= 1 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś kierowcą w pojeździe!");
		end
		
		local veh = GetPlayerVehicleID(playerid)
		SetVehicleDoorsLockedForPlayers(veh, 2)
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Twój pojazd został zamknięty!");
	end
	
	cmds.unlock = function(playerid)
		if not IsPlayerInAnyVehicle(playerid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś w żadnym pojeździe!");
		end
		if GetPlayerVehicleSeat(playerid) >= 1 then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie jesteś kierowcą w pojeździe!");
		end
		
		local veh = GetPlayerVehicleID(playerid)
		SetVehicleDoorsLockedForPlayers(veh, 0)
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Twój pojazd został otwarty!");
	end
	
	cmds.serverstats = function(playerid)
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Statystyki serwera:")
		SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
		SendMessageToPlayer(playerid, "~b~| ~w~Czas działania: ~g~"..(math.floor(UpTimeN/(60*60*24))).." ~w~Dni, ~y~"..(math.floor(UpTimeN/(60*60))%24).." ~w~Godzin, ~y~"..(math.floor(UpTimeN/60)%60).." ~w~Minut, ~y~"..math.floor(UpTimeN%60).." ~w~Sekund")
		SendMessageToPlayer(playerid, "~b~| ~w~Całkowity czas działania: ~g~"..(math.floor(UpTime/(60*60*24))).." ~w~Dni, ~y~"..(math.floor(UpTime/(60*60))%24).." ~w~Godzin, ~y~"..(math.floor(UpTime/60)%60).." ~w~Minut, ~y~"..math.floor(UpTime%60).." ~w~Sekund")
		SendMessageToPlayer(playerid, "~b~| ~w~Zarejestrowanych kont: ~g~"..Accounts)
		SendMessageToPlayer(playerid, "~b~| ~w~Połączeń z serwerem: ~g~"..Conn)
		SendMessageToPlayer(playerid, "~b~|------------------------------------------------|")
	end
	
	cmds.ping = function(playerid)
		SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Ping dla "..playername.."(ID:.."..playerid..")(IP: "..GetPlayerIp(playerid)..") to "..GetPlayerPing(playerid).." ms");
	end
	
	cmds.report = function(playerid, targetid, ...)
		reason = table.concat({...}, " ");
		if (checkparams(targetid, "i", reason, "a")) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Użyj /report [id] [powód]");
		end
		if not IsPlayerConnected(targetid) then
			return SendMessageToPlayer(playerid, "~w~[~r~BŁĄD~w~]Nie możesz wysłać skargi na nie grającego użytkownika!");
		end
		if IsPlayerAdmin[targetid] == 1 then
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Zgłosiłeś(aś) "..GetPlayerName(targetid).." (ID: "..targetid..") powód: "..reason);
			local Skargi = LoadINIFile("raporty.ini");
			WriteString(Skargi, "Skargi", "[!Admin!] "..(os.date ("%x %X")), GetPlayerName(playerid).." zgłosił(a), że Administrator '"..GetPlayerName(targetid).."' oszukiwał(a)/nadużywał(a) władzy, powód: "..reason)
			CloseINIFile(Skargi)
		else
			SendMessageToPlayer(playerid, "~w~[~y~INFO~w~]Zgłosiłeś(aś) "..GetPlayerName(targetid).." (ID: "..targetid..") powód: "..reason);
			local Skargi = LoadINIFile("raporty.ini");
			WriteString(Skargi, "Skargi", (os.date ("%x %X")), GetPlayerName(playerid).." zgłosił(a), że '"..GetPlayerName(targetid).."' oszukiwał(a), powód: "..reason)
			CloseINIFile(Skargi)
		end
	end
	-------------------- COMMAND PROCESSOR ----------------------------
	local args = string.split(message, " ");
	sCmd = string.lower(args[1]);
	sCmd = string.gsub(sCmd, "/", "");
	args[1] = playerid;
	if (cmds[sCmd] == nil) then
		isAltKey = false;
		for k,v in pairs(cmds) do
			if (string.lower(k) == sCmd) then
				isAltKey = true;
				sCmd = k;
				break;
			end
		end
		if (isAltKey == false) then
			return 0;
		end
	end
	for i=2, #args do
		if (tonumber(args[i]) ~= nil) then
			args[i] = tonumber(args[i]);
		end
	end
	if (OnPlayerCommandReceived ~= nil) then
		local beforeCmd = OnPlayerCommandReceived(playerid, string.lower(sCmd));
		if (beforeCmd == 0) then
			return 1;
		end
	end
	result = cmds[sCmd](table.unpack(args));
	if (OnPlayerCommandPerformed ~= nil) then
		local afterCmd = OnPlayerCommandPerformed(playerid, string.lower(sCmd), result);
		if (afterCmd == 0) then
			return 0;
		else
			return 1;
		end
	else
		if (result == 0) then
			return 0;
		end
	end
	return 1;
end

function checkparams(...)
	arg = {...};
	if (#arg % 2 ~= 0) then return true end;
	for i=2, #arg, 2 do
		if (arg[i-1] == nil) then
			return true;
		end
		if (type(arg[i]) == "table") then
			for n=1, #arg[i] do
				if (string.lower(arg[i-1]) == string.lower(arg[i][n])) then
					return false;
				end
			end
			return true;
		elseif (arg[i] == "a") then
			if (arg[i-1] == "") then
				return true;
			end
		elseif (type(arg[i-1]) == "number") and (arg[i] ~= "i") then
			return true;
		elseif (type(arg[i-1]) == "string") and (arg[i] ~= "s") then
			return true;
		elseif (type(arg[i-1]) == "string") and (arg[i-1] == "") then
			return true;
		end
	end
	return false;
end

function addCommand(scmd, func)
	scmd = string.lower(scmd);
	cmds[scmd] = func;
end

function addAltCommand(scmd, saltcmd)
	scmd = string.lower(scmd);
	saltcmd = string.lower(saltcmd);
	if (cmds[scmd] ~= nil) then
		cmds[saltcmd] = cmds[scmd];
		return true;
	else
		for k,v in pairs(cmds) do
			if (string.lower(k) == scmd) then
				cmds[saltcmd] = cmds[k];
				return true;
			end
		end
	end
	return false;
end 

function string.split(text, sep)
    local sep, fields = sep or ":", {}
    local pattern = string.format("([^%s]+)", sep)
    text:gsub(pattern, function(c) fields[#fields+1] = c end)
    return fields
end

function PrepareSaveStats()
	SaveSettings()
	if GetPlayerCount() > 0 then
		for i=0, GetPlayerPoolSize() do
			if IsPlayerConnected(i) then
				if IsLoggedIn[i] == 1 then
					SaveStats(i)
				end
			end
		end	
	end
	return 1;
end

function SaveStats(playerid)
	local playername = GetPlayerName(playerid)
	local UserINI = LoadINIFile("Konta/"..playername..".ini")
	local x, y, z = GetPlayerPosition(playerid)
	WriteString(UserINI, "Konto", "LastLogin", (os.date ("%x %X")))
	WriteString(UserINI, "Konto", "Money", GetPlayerMoney(playerid))
	WriteInteger(UserINI, "Konto", "Respekt", XP[playerid])
	WriteString(UserINI, "Konto", "LastPosX", x)
	WriteString(UserINI, "Konto", "LastPosY", y)
	WriteString(UserINI, "Konto", "LastPosZ", z)
	WriteInteger(UserINI, "Konto", "PlayedTime", ReadInteger(UserINI, "Konto", "PlayedTime") + PlayerSecondsO[playerid])
	PlayerSecondsO[playerid] = 0;
	WriteString(UserINI, "Konto", "LastSkinID", GetPlayerModel(playerid))
	WriteString(UserINI, "Konto", "ChatColor", Color[playerid])
	WriteInteger(UserINI, "Konto", "Kills", Kills[playerid])
	WriteInteger(UserINI, "Konto", "Deaths", Deaths[playerid])
	WriteInteger(UserINI, "Konto", "DMG.Done", DMGD[playerid])
	WriteInteger(UserINI, "Konto", "DMG.Received", DMGR[playerid])
	WriteInteger(UserINI, "Konto", "Odwiedzin", Odwiedzin[playerid])
	WriteInteger(UserINI, "Konto", "Wiad",Wiad[playerid])
	CloseINIFile(UserINI)
	ShowMessageToPlayer(playerid, "~w~[~y~Auto~r~SAVE~w~] Statystyki zapisane na nick ~r~"..playername)
	return 1;
end

function Reklama()
	local Reklamy = {
	{ "~w~[~y~B~r~O~b~T~w~] Dodaj serwer do ulubionych! ~y~IP~w~: ~r~85.219.133.18" },
	{ "~w~[~y~B~r~O~b~T~w~] Dostępne komendy znajdziesz pod ~r~/cmd" },
	{ "~w~[~y~B~r~O~b~T~w~] ~m~Warto ~w~się ~y~zarejestrować! ~w~Użyj ~r~/r ~b~[hasło]" },
	{ "~w~[~y~B~r~O~b~T~w~] Na serwerze jest ~p~"..GetPlayerCount().." / "..GetMaxPlayers().." ~w~graczy online." },
	{ "~w~[~y~B~r~O~b~T~w~] Sprawdź swoje staty! ~r~/stats" },
	{ "~w~[~y~B~r~O~b~T~w~] Sprawdź staty innego gracza! ~r~/stats ~b~[nick gracza]" },
	{ "~w~[~y~B~r~O~b~T~w~] Zmień swój kolor nicku! ~r~/color ~b~[kolor]" },
	{ "~w~[~y~B~r~O~b~T~w~] Możesz naprawić swój pojazd! ~r~/repair" },
	{ "~w~[~y~B~r~O~b~T~w~] Sprawdź swoje staty aktualnej sesji! ~r~/session" },
	{ "~w~[~y~B~r~O~b~T~w~] Dodaj przed nick ~r~[PPS]~w~ aby otrzymywać 2x więcej respektu!" },
	{ "~w~[~y~B~r~O~b~T~w~] Zapraszamy na forum serwera: ~r~http://85.219.133.18/pps/" },
	{ "~w~[~y~B~r~O~b~T~w~] Widzisz gracza/admina łamiącego regulamin?: ~r~/report [id] [powod]" },
	}
	local rand = math.random (1, #Reklamy)
	ShowMessageToAll(Reklamy[rand][1])
	return 1;
end

function Dystrybutor(timerid, playerid)
	if IsLoggedIn[playerid] == 1 then
		if string.find(GetPlayerName(playerid), "[PPS]") then
			XP[playerid] = XP[playerid] + 4
			ShowMessageToPlayer(playerid, "Otrzymałeś(aś) ~r~4 punkty ~w~respektu za ~r~2 minuty ~w~grania oraz ~r~tag [PPS]")
			RemoveTimer(timerid)
			CreateTimer("Dystrybutor", 120000, playerid)
		else
			XP[playerid] = XP[playerid] + 2
			ShowMessageToPlayer(playerid, "Otrzymałeś(aś) ~r~2 punkty ~w~respektu za ~r~2 minuty ~w~grania!")
			RemoveTimer(timerid)
			CreateTimer("Dystrybutor", 120000, playerid)
		end
	end
	return 1;
end

function LoadSettings()
	local exist = io.open("./scriptfiles/Ustawienia.ini", "r")
	if exist then
		local Settings = LoadINIFile("Ustawienia.ini")
		Accounts = ReadInteger(Settings, "Statystyki_Serwera", "Kont")
		Conn = ReadInteger(Settings, "Statystyki_Serwera", "Połączeń")
		UpTime = ReadInteger(Settings, "Statystyki_Serwera", "UpTime")
		CloseINIFile(Settings)
	else
		print("Plik ustawien nie zostal znaleziony! Tworze nowy z domyslnymi wartosciami...")
		local Settings = LoadINIFile("Ustawienia.ini")
		WriteInteger(Settings, "Ustawienia", "CanRegister", 1)
		WriteInteger(Settings, "Statystyki_Serwera", "Kont", 0)
		print("Kont=0")
		WriteInteger(Settings, "Statystyki_Serwera", "Połączeń", 0)
		print("Polaczen=0")
		WriteInteger(Settings, "Statystyki_Serwera", "Kicków", 0)
		print("Kickow=0")
		WriteInteger(Settings, "Statystyki_Serwera", "Banów", 0)
		print("Banow=0")
		WriteInteger(Settings, "Statystyki_Serwera", "UpTime", 0)
		print("UpTime=0")
		CloseINIFile(Settings)
		end
	return 1;
end

function SaveSettings()
	local exist = io.open("./scriptfiles/Ustawienia.ini", "r")
	if exist then
		local Settings = LoadINIFile("Ustawienia.ini")
		WriteInteger(Settings, "Statystyki_Serwera", "Kont", Accounts)
		WriteInteger(Settings, "Statystyki_Serwera", "Połączeń", Conn)
		WriteInteger(Settings, "Statystyki_Serwera", "UpTime", UpTime)
		CloseINIFile(Settings)
	else
		print("CRITICAL ERROR! - Plik ustawien nie zostal znaleziony! Nie mozna zapisac statystyk!")
	end
	return 1;
end
