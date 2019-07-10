
local speedBuffer  = {}
local velBuffer    = {}
local beltOn       = false
local isincar     = false

IsCar = function(veh)
		    local vc = GetVehicleClass(veh)
		    return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
        end	

heading = function (entity)
		    local hr = GetEntityHeading(entity) + 90.0
		    if hr < 0.0 then hr = 360.0 + hr end
		    hr = hr * 0.0174533
		    return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
      end

Citizen.CreateThread(function()
	Citizen.Wait(10)
	while true do
		
		local ped = GetPlayerPed(-1)
		local car = GetVehiclePedIsIn(ped)
		
		if car ~= 0 and (isincar or IsCar(car)) then
		
			isincar = true
			
				if beltOn then DisableControlAction(0, 75) end
			
				speedBuffer[2] = speedBuffer[1]
				speedBuffer[1] = GetEntitySpeed(car)
			
					if speedBuffer[2] ~= nil 
					and not beltOn
					and GetEntitySpeedVector(car, true).y > 1.0  
					and speedBuffer[1] > Cfg.MinSpeed 
					and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * Cfg.DiffTrigger) then
					impactdammage()
					local co = GetEntityCoords(ped)
					local fw = heading(ped)
					SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
					SetEntityVelocity(ped, velBuffer[2].x, velBuffer[2].y, velBuffer[2].z)
					Citizen.Wait(1)
					SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                    --Citizen.Wait(500)
					--DoScreenFadeOut(100)
					--Citizen.Wait(15000)
					--DoScreenFadeIn(250)

					else
						if speedBuffer[2] ~= nil 
						and beltOn
						and GetEntitySpeedVector(car, true).y > 1.0  
						and speedBuffer[1] > Cfg.MinSpeed 
						and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[1] * Cfg.DiffTrigger) then
						impactdammage()
						--DoScreenFadeOut(100)
						--Citizen.Wait(8000)
						--DoScreenFadeIn(250)

                        end
					end
				
					velBuffer[2] = velBuffer[1]
					velBuffer[1] = GetEntityVelocity(car)
				
						if IsControlJustReleased(0, Cfg.BeltKey) then
						beltOn = not beltOn				  
						if beltOn then 
						--sendNotification('Seatbelt ON', 'success', 2500)
						else 
						--sendNotification('Seatbelt OFF', 'error', 2500)
					end 
 
				end
			
		elseif isincar then
			isincar = false
			beltOn = false
			speedBuffer[1], speedBuffer[2] = 0.0, 0.0
			else
			Wait(2000)
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(8)
	            
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
			if beltOn then
            DrawTxt(Cfg.Displayx,Cfg.Displayy, 1.165,1.122,0.45,"BELT", 0,255,0,255)
			elseif not beltOn then
            DrawTxt(Cfg.Displayx,Cfg.Displayy, 1.165,1.122,0.45,"BELT", 255,0,0,255)
			end
			else
			Wait(2000)
		end
	end
end)




function DrawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


--notification
function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "duty",
		theme = "gta",
		timeout = messageTimeout,
		layout = "bottomCenter"

	})
end
function impactdammage()
print"tyretest"
if Cfg.DoVehicleDammage then
local Dcar = GetVehiclePedIsIn(ped)
		
	chance = math.random(1,3)
	if chance > 0 then
	tyre = math.random(1,2)
print(tyre)
	SetVehicleTyreBurst(Dcar,tyre,false,1000.0)
	SetVehicleDamage(Dcar,0.0,0.0,0.0,1000,1,true)
			end
		end
end
