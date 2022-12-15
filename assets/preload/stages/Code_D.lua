local xx = 400;
local yy = 125;
local xx2 = 820;
local yy2 = 125;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
local beating = false;
local beat_skip = 0;
local dadZoom = 0.7;
local bfZoom = 0.7;

function onCreatePost()--this thing happens once the characters are spawned

    setProperty("gf.visible", false);

end

function onCreate()
	--background boi
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('scenema','cutscene', 0, 0)
	makeLuaSprite('Floor','C/Floor', -1000, -2250)
	makeLuaSprite('sky','C/sky', -1000, -2000)
	setScrollFactor('sky', 0.5, 0.5);
	makeLuaSprite('tryagain1','C/cut1', 0, 0)
	makeLuaSprite('tryagain2','C/cut2', 0, 0)


    addLuaSprite('sky')
	addLuaSprite('Floor')
	
	addLuaSprite('flashwhite')
	addLuaSprite('scenema')
	
	addLuaSprite('tryagain1')
	addLuaSprite('tryagain2')
	
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('scenema.alpha', 0);
	setObjectCamera('scenema', 'other');
	setProperty('tryagain1.alpha', 0);
	setObjectCamera('tryagain1', 'hud');
	setProperty('tryagain2.alpha', 0);
	setObjectCamera('tryagain2', 'hud');
	
end

function onBeatHit()
    if beat_skip == 0 then
	    beat_skip = 1
        if beating == true then
	        triggerEvent('Add Camera Zoom', 0.06, 0.04)
		end
	else
	    beat_skip = 0
	    
end
end

function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown2', 'flashwhite', 0, 0.5, 'linear');
end

function onStepHit()
        if curStep == 640 or curStep == 1321 or curStep == 1610 then
		flash();
		end
	    if curStep == 384 or curStep == 1321 or curStep == 1610 or curStep == 1866 then
		beating = true;
		end
		if curStep == 640 or curStep == 1576 then
		beating = false;
		end
		if curStep == 1295 then
		setProperty('camHUD.visible', false);
		setProperty('scenema.alpha', 1);
		end
		if curStep == 1321 then
		setProperty('camHUD.visible', true);
		setProperty('scenema.alpha', 0);
		end
		if curStep == 1580 then
		setProperty('tryagain1.alpha', 1);
		end
		if curStep == 1601 then
		setProperty('tryagain1.alpha', 0);
		setProperty('tryagain2.alpha', 1);
		end
		if curStep == 1610 then
		setProperty('tryagain1.alpha', 0);
		setProperty('tryagain2.alpha', 0);
		end
end


function onUpdate(elapsed)

    if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom',dadZoom)

            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            setProperty('defaultCamZoom',bfZoom)

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end


function opponentNoteHit()
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end