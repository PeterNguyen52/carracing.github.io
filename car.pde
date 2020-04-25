void setup() {
    size(1000, 600);
    background(125);
}

var init_x_1 = 0;
var init_x_2 = 0;
var init_x_3 = 0;

var init_y_1 = random(100, 200);
var init_y_2 = random(200, 400);
var init_y_3 = random(400, 450);

var n = 0.01;
var stone_x_1 = random(150, 500);
var stone_x_2 = random(150, 500);

var stone_y_1 = random(150, 500);
var stone_y_2 = random(150, 500);

//// voi moi xe, dung 4 bien luu tru vi tri cua xe
//// Xe 1:
var car_x11 ;var car_y11 ;var car_x12 ;var car_y12 ;
//// Xe 2:
var car_x21 ;var car_y21 ;var car_x22 ;var car_y22 ;
//// Xe 3:
var car_x31 ;var car_y31 ;var car_x32 ;var car_y32 ;
//// Stone 1: 
var stone_x11 ;var stone_y11 ;var stone_x12 ;var stone_y12 ;

var drawCar = function(carIndex, x, y, z, color) {
    // draw the car body
    // moi xe cau tao tu 2 hinh chu nhat va 2 banh xe, ben ngoai bao phu mot hinh chu nhat khac lon hon dung de quy chieu khi xac dinh vi tri khi va cham
    noFill();
    rect(x, y + 78 + 50 * sin(x * n), z + 100, z + 64);
    fill(255, 0, color);
    rect(x, y + 100 + 50 * sin(x * n), z + 100, z + 20);
    rect(x + 15, y + 78 + 50 * sin(x * n), z + 70, z + 40);
    // draw the wheels
    fill(77, color, 66);
    ellipse(x + 25 + z / 2, y + 130 + 50 * sin(x * n) + z / 2, z + 24, z + 24);
    ellipse(x + 85 + z / 2, y + 130 + 50 * sin(x * n) + z / 2, z + 24, z + 24);


    //// Tra ve vi tri cua xe:
    if (carIndex == 1) {
        car_x11 = x;
        car_y11 = y + 78 + 50 * sin(x * n);
        car_x12 = z + 100;
        car_y12 = z + 64;
    } else if (carIndex == 2) {
        car_x21 = x;
        car_y21 = y + 78 + 50 * sin(x * n);
        car_x22 = z + 100;
        car_y22 = z + 64;
    } else if (carIndex == 3) {
        car_x31 = x;
        car_y31 = y + 78 + 50 * sin(x * n);
        car_x32 = z + 100;
        car_y32 = z + 64;
    }
}
var stone = function(x, y) {
    fill(132, 0, 255);
    rect(x, y, 70, 70);

    //// Tra ve vi tri cua stone
    stone_x11 = x;
    stone_y11 = y;
    stone_x12 = 70;
    stone_y12 = 70;
}
var sun_x = 0;
var sun = function(x) {
    fill(255, 255, 0);
    ellipse(x, 60, 120, 120);
}
var cloud_x = 3;
var cloud = function(cloud_x) {
    fill(255, 255, 255);
    ellipse(cloud_x, 50, 126, 97);
    ellipse(cloud_x + 62, 50, 70, 60);
    ellipse(cloud_x - 62, 50, 70, 60);
}

var check_2car = function(x11, y11, x12, y12, x21, y21, x22, y22) {
    var byOx = (x11 < x21 + x22) && (x21 < x11 + x12);// toa do x,y xe 1 so voi toa do x,y xe 2 cong voi do dai va chieu cao xe tuong ung
    var byOy = (y11 < y21 + y22) && (y21 < y11 + y12);
    if (byOx && byOy) {
        console.log('Hai xe va cham nhau');
        return true;
    }
    return false;
}

var boom = function(x, y) {
    fill(247, 255, 0);
    textSize(20);
    ellipse(x + 33, y + 25, 120, 50);
    fill(0, 0, 0);
    text("BANG!!!", x, y + 30);
}

var check_car_stone = function(x11, y11, x12, y12, x21, y21, x22, y22) {
    var byOx = (x11 < x21 + x22) && (x21 < x11 + x12);
    var byOy = (y11 < y21 + y22) && (y21 < y11 + y12);
    if (byOx && byOy) {
        console.log('Xe va cham vao da');
        return true;
    }
    return false;
}

var a_x_1, a_y_1, a_x_2, a_y_2, a_x_3, a_y_3;// bien toc do
var v_1_2, v_1_3, v_2_3;// bien kiem tra va cham 2 xe
draw = function() {
    noStroke();
    background(151, 244, 547);
    drawCar(1, init_x_1, init_y_1, 20, 0);// truyen tham so vao de ve car, dong thoi xac dinh carIndex de tra ve cac toa do cua hinh cn ben ngoai
    drawCar(2, init_x_2, init_y_2, 10, 100);
    drawCar(3, init_x_3, init_y_3, 30, 200);

    // 2 xe lan luot va cham nhau
    if (check_2car(car_x11, car_y11, car_x12, car_y12,// truyen tham so la toa do cua 2 hinh cn ben ngoai hai xe de kiem tra dieu kien
            car_x21, car_y21, car_x22, car_y22)) {
        boom(init_x_1, init_y_1);
        a_x_1 = a_x_2 = a_y_1 = a_y_2 = 0;
        a_x_3 = random(3, 5);
        a_y_3 = random(-1, 1);
        v_1_2 = true;

    }

    if (check_2car(car_x11, car_y11, car_x12, car_y12,
            car_x31, car_y31, car_x32, car_y32)) {
        // neu xe 1 va cham xe 3 thif dung ca 2
        boom(init_x_3, init_y_3);
        a_x_1 = a_x_3 = a_y_1 = a_y_3 = 0;
        a_x_2 = random(0, 1);
        a_y_2 = random(-3, 3);
        v_1_3 = true;
    }
  
    if (check_2car(car_x21, car_y21, car_x22, car_y22,
            car_x31, car_y31, car_x32, car_y32)) {
        boom(init_x_2, init_y_2);
        a_x_3 = a_x_2 = a_y_3 = a_y_2 = 0;
        a_x_1 = random(0, 3);
        a_y_1 = random(-3, 3);
        v_2_3 = true;
    }

    // neu ko co xe nao va cham nhau
    if (!(v_1_2 || v_1_3 || v_2_3)) {
        a_x_1 = random(0, 3);
        a_x_2 = random(0, 1);
        a_x_3 = random(3, 5);
        a_y_1 = random(-3, 3);
        a_y_2 = random(-3, 3);
        a_y_3 = random(-1, 1);

    }
    // vật cản
    stone(stone_x_1, stone_y_1);
var s_1;
    // check car vs stone1
    if (check_car_stone(car_x11, car_y11, car_x12, car_y12,
            stone_x11, stone_y11, stone_x12, stone_y12)) {
        console.log("Xe 1 cham vao da");
        boom(stone_x_1, stone_y_1);
        a_x_1 = a_y_1 = 0;
        console.log(s_1);
        s_1 = true;
    }
    if(s_1 && a_x_2!=0){
        a_x_2 = random(0, 1);
        a_x_3 = random(3, 5);
        a_y_1 = random(-3, 3);
        a_y_2 = random(-3, 3);
        a_y_3 = random(-1, 1);
    }

    if (check_car_stone(car_x21, car_y21, car_x22, car_y22,
            stone_x11, stone_y11, stone_x12, stone_y12)) {
        console.log("Xe 2 cham vao da");
        boom(stone_x_1, stone_y_1);
        a_x_2 = a_y_2 = 0;
    }
    if (check_car_stone(car_x31, car_y31, car_x32, car_y32,
            stone_x11, stone_y11, stone_x12, stone_y12)) {
        console.log("Xe 3 cham vao da");
        boom(stone_x_1, stone_y_1);
        a_x_3 = a_y_3 = 0;
    }

    if (init_x_1 >= 830 || init_x_2 >= 830 || init_x_3 >= 830) {
        a_x_1 = a_y_1 = a_x_2 = a_y_2 = a_x_3 = a_y_3 = 0;
        fill(0, 0, 0);
        textSize(50);
        text("GAME OVER", 350, 300);

    }
    // tốc độ
    init_x_1 += a_x_1;
    init_y_1 += a_y_1;
    init_x_2 += a_x_2;
    init_y_2 += a_y_2;
    init_x_3 += a_x_3;
    init_y_3 += a_y_3;
    // mặt trời
    sun(1100 + sun_x);
    sun_x -= 1;
    cloud(135 + cloud_x);
    cloud(450 + cloud_x);
    cloud_x += 1;
    // vạch đích
    fill(50, 50, 50);
    rect(950, 150, 5, 600);
    // RACING CAR
    fill(240, 67, 14);
    textSize(50);
    text("RACING CAR", 50, 50);
    // cỏ
    fill(14, 240, 89);
    for (var glass_x = 10; glass_x <= 900; glass_x += 100) {
        rect(glass_x, 580, 70, 60);
    }

};