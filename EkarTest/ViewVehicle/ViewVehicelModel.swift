//
//  ViewVehicelModel.swift
//  EkarTest
//
//  Created by Aqib Javed on 24/10/2023.
//

import Foundation
struct ViewVehicelModel : Codable {
    let success : Bool?
    let input : Input?
    let attributes : Attributes?
    let colors : [Colors]?
    let equipment : Equipment?
    let warranties : [Warranties]?
    var images: [VehicleImage]?
    let timestamp : String?

    enum CodingKeys: String, CodingKey {

        case success = "success"
        case input = "input"
        case attributes = "attributes"
        case colors = "colors"
        case equipment = "equipment"
        case warranties = "warranties"
        case timestamp = "timestamp"
        case images = "images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        input = try values.decodeIfPresent(Input.self, forKey: .input)
        attributes = try values.decodeIfPresent(Attributes.self, forKey: .attributes)
        colors = try values.decodeIfPresent([Colors].self, forKey: .colors)
        equipment = try values.decodeIfPresent(Equipment.self, forKey: .equipment)
        warranties = try values.decodeIfPresent([Warranties].self, forKey: .warranties)
        timestamp = try values.decodeIfPresent(String.self, forKey: .timestamp)
        images = try values.decodeIfPresent([VehicleImage].self, forKey: .images)
    }

}

struct VehicleImageList: Codable {
    let images: [VehicleImage]?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.images = try container.decodeIfPresent([VehicleImage].self, forKey: .images)
    }
}

struct VehicleImage: Codable, Identifiable {
    let link: String?
    let width: Int?
    let height: Int?
    let thumbnailLink: String?
    let id: String = UUID().uuidString

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.link = try container.decodeIfPresent(String.self, forKey: .link)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.thumbnailLink = try container.decodeIfPresent(String.self, forKey: .thumbnailLink)
    }
}

struct Attributes : Codable {
    let year : String?
    let make : String?
    let model : String?
    let trim : String?
    let style : String?
    let type : String?
    let size : String?
    let category : String?
    let made_in : String?
    let made_in_city : String?
    let doors : String?
    let fuel_type : String?
    let fuel_capacity : String?
    let city_mileage : String?
    let highway_mileage : String?
    let engine : String?
    let engine_size : String?
    let engine_cylinders : String?
    let transmission : String?
    let transmission_short : String?
    let transmission_type : String?
    let transmission_speeds : String?
    let drivetrain : String?
    let anti_brake_system : String?
    let steering_type : String?
    let curb_weight : String?
    let gross_vehicle_weight_rating : String?
    let overall_height : String?
    let overall_length : String?
    let overall_width : String?
    let wheelbase_length : String?
    let standard_seating : String?
    let invoice_price : String?
    let delivery_charges : String?
    let manufacturer_suggested_retail_price : String?
    let production_seq_number : String?
    let front_brake_type : String?
    let rear_brake_type : String?
    let turning_diameter : String?
    let front_suspension : String?
    let rear_suspension : String?
    let front_spring_type : String?
    let rear_spring_type : String?
    let tires : String?
    let front_headroom : String?
    let rear_headroom : String?
    let front_legroom : String?
    let rear_legroom : String?
    let front_shoulder_room : String?
    let rear_shoulder_room : String?
    let front_hip_room : String?
    let rear_hip_room : String?
    let interior_trim : [String]?
    let exterior_color : [String]?
    let curb_weight_manual : String?
    let ground_clearance : String?
    let track_front : String?
    let track_rear : String?
    let cargo_length : String?
    let width_at_wheelwell : String?
    let width_at_wall : String?
    let depth : String?
    let optional_seating : String?
    let passenger_volume : String?
    let cargo_volume : String?
    let standard_towing : String?
    let maximum_towing : String?
    let standard_payload : String?
    let maximum_payload : String?
    let maximum_gvwr : String?

    enum CodingKeys: String, CodingKey {

        case year = "year"
        case make = "make"
        case model = "model"
        case trim = "trim"
        case style = "style"
        case type = "type"
        case size = "size"
        case category = "category"
        case made_in = "made_in"
        case made_in_city = "made_in_city"
        case doors = "doors"
        case fuel_type = "fuel_type"
        case fuel_capacity = "fuel_capacity"
        case city_mileage = "city_mileage"
        case highway_mileage = "highway_mileage"
        case engine = "engine"
        case engine_size = "engine_size"
        case engine_cylinders = "engine_cylinders"
        case transmission = "transmission"
        case transmission_short = "transmission_short"
        case transmission_type = "transmission_type"
        case transmission_speeds = "transmission_speeds"
        case drivetrain = "drivetrain"
        case anti_brake_system = "anti_brake_system"
        case steering_type = "steering_type"
        case curb_weight = "curb_weight"
        case gross_vehicle_weight_rating = "gross_vehicle_weight_rating"
        case overall_height = "overall_height"
        case overall_length = "overall_length"
        case overall_width = "overall_width"
        case wheelbase_length = "wheelbase_length"
        case standard_seating = "standard_seating"
        case invoice_price = "invoice_price"
        case delivery_charges = "delivery_charges"
        case manufacturer_suggested_retail_price = "manufacturer_suggested_retail_price"
        case production_seq_number = "production_seq_number"
        case front_brake_type = "front_brake_type"
        case rear_brake_type = "rear_brake_type"
        case turning_diameter = "turning_diameter"
        case front_suspension = "front_suspension"
        case rear_suspension = "rear_suspension"
        case front_spring_type = "front_spring_type"
        case rear_spring_type = "rear_spring_type"
        case tires = "tires"
        case front_headroom = "front_headroom"
        case rear_headroom = "rear_headroom"
        case front_legroom = "front_legroom"
        case rear_legroom = "rear_legroom"
        case front_shoulder_room = "front_shoulder_room"
        case rear_shoulder_room = "rear_shoulder_room"
        case front_hip_room = "front_hip_room"
        case rear_hip_room = "rear_hip_room"
        case interior_trim = "interior_trim"
        case exterior_color = "exterior_color"
        case curb_weight_manual = "curb_weight_manual"
        case ground_clearance = "ground_clearance"
        case track_front = "track_front"
        case track_rear = "track_rear"
        case cargo_length = "cargo_length"
        case width_at_wheelwell = "width_at_wheelwell"
        case width_at_wall = "width_at_wall"
        case depth = "depth"
        case optional_seating = "optional_seating"
        case passenger_volume = "passenger_volume"
        case cargo_volume = "cargo_volume"
        case standard_towing = "standard_towing"
        case maximum_towing = "maximum_towing"
        case standard_payload = "standard_payload"
        case maximum_payload = "maximum_payload"
        case maximum_gvwr = "maximum_gvwr"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        year = try values.decodeIfPresent(String.self, forKey: .year)
        make = try values.decodeIfPresent(String.self, forKey: .make)
        model = try values.decodeIfPresent(String.self, forKey: .model)
        trim = try values.decodeIfPresent(String.self, forKey: .trim)
        style = try values.decodeIfPresent(String.self, forKey: .style)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        size = try values.decodeIfPresent(String.self, forKey: .size)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        made_in = try values.decodeIfPresent(String.self, forKey: .made_in)
        made_in_city = try values.decodeIfPresent(String.self, forKey: .made_in_city)
        doors = try values.decodeIfPresent(String.self, forKey: .doors)
        fuel_type = try values.decodeIfPresent(String.self, forKey: .fuel_type)
        fuel_capacity = try values.decodeIfPresent(String.self, forKey: .fuel_capacity)
        city_mileage = try values.decodeIfPresent(String.self, forKey: .city_mileage)
        highway_mileage = try values.decodeIfPresent(String.self, forKey: .highway_mileage)
        engine = try values.decodeIfPresent(String.self, forKey: .engine)
        engine_size = try values.decodeIfPresent(String.self, forKey: .engine_size)
        engine_cylinders = try values.decodeIfPresent(String.self, forKey: .engine_cylinders)
        transmission = try values.decodeIfPresent(String.self, forKey: .transmission)
        transmission_short = try values.decodeIfPresent(String.self, forKey: .transmission_short)
        transmission_type = try values.decodeIfPresent(String.self, forKey: .transmission_type)
        transmission_speeds = try values.decodeIfPresent(String.self, forKey: .transmission_speeds)
        drivetrain = try values.decodeIfPresent(String.self, forKey: .drivetrain)
        anti_brake_system = try values.decodeIfPresent(String.self, forKey: .anti_brake_system)
        steering_type = try values.decodeIfPresent(String.self, forKey: .steering_type)
        curb_weight = try values.decodeIfPresent(String.self, forKey: .curb_weight)
        gross_vehicle_weight_rating = try values.decodeIfPresent(String.self, forKey: .gross_vehicle_weight_rating)
        overall_height = try values.decodeIfPresent(String.self, forKey: .overall_height)
        overall_length = try values.decodeIfPresent(String.self, forKey: .overall_length)
        overall_width = try values.decodeIfPresent(String.self, forKey: .overall_width)
        wheelbase_length = try values.decodeIfPresent(String.self, forKey: .wheelbase_length)
        standard_seating = try values.decodeIfPresent(String.self, forKey: .standard_seating)
        invoice_price = try values.decodeIfPresent(String.self, forKey: .invoice_price)
        delivery_charges = try values.decodeIfPresent(String.self, forKey: .delivery_charges)
        manufacturer_suggested_retail_price = try values.decodeIfPresent(String.self, forKey: .manufacturer_suggested_retail_price)
        production_seq_number = try values.decodeIfPresent(String.self, forKey: .production_seq_number)
        front_brake_type = try values.decodeIfPresent(String.self, forKey: .front_brake_type)
        rear_brake_type = try values.decodeIfPresent(String.self, forKey: .rear_brake_type)
        turning_diameter = try values.decodeIfPresent(String.self, forKey: .turning_diameter)
        front_suspension = try values.decodeIfPresent(String.self, forKey: .front_suspension)
        rear_suspension = try values.decodeIfPresent(String.self, forKey: .rear_suspension)
        front_spring_type = try values.decodeIfPresent(String.self, forKey: .front_spring_type)
        rear_spring_type = try values.decodeIfPresent(String.self, forKey: .rear_spring_type)
        tires = try values.decodeIfPresent(String.self, forKey: .tires)
        front_headroom = try values.decodeIfPresent(String.self, forKey: .front_headroom)
        rear_headroom = try values.decodeIfPresent(String.self, forKey: .rear_headroom)
        front_legroom = try values.decodeIfPresent(String.self, forKey: .front_legroom)
        rear_legroom = try values.decodeIfPresent(String.self, forKey: .rear_legroom)
        front_shoulder_room = try values.decodeIfPresent(String.self, forKey: .front_shoulder_room)
        rear_shoulder_room = try values.decodeIfPresent(String.self, forKey: .rear_shoulder_room)
        front_hip_room = try values.decodeIfPresent(String.self, forKey: .front_hip_room)
        rear_hip_room = try values.decodeIfPresent(String.self, forKey: .rear_hip_room)
        interior_trim = try values.decodeIfPresent([String].self, forKey: .interior_trim)
        exterior_color = try values.decodeIfPresent([String].self, forKey: .exterior_color)
        curb_weight_manual = try values.decodeIfPresent(String.self, forKey: .curb_weight_manual)
        ground_clearance = try values.decodeIfPresent(String.self, forKey: .ground_clearance)
        track_front = try values.decodeIfPresent(String.self, forKey: .track_front)
        track_rear = try values.decodeIfPresent(String.self, forKey: .track_rear)
        cargo_length = try values.decodeIfPresent(String.self, forKey: .cargo_length)
        width_at_wheelwell = try values.decodeIfPresent(String.self, forKey: .width_at_wheelwell)
        width_at_wall = try values.decodeIfPresent(String.self, forKey: .width_at_wall)
        depth = try values.decodeIfPresent(String.self, forKey: .depth)
        optional_seating = try values.decodeIfPresent(String.self, forKey: .optional_seating)
        passenger_volume = try values.decodeIfPresent(String.self, forKey: .passenger_volume)
        cargo_volume = try values.decodeIfPresent(String.self, forKey: .cargo_volume)
        standard_towing = try values.decodeIfPresent(String.self, forKey: .standard_towing)
        maximum_towing = try values.decodeIfPresent(String.self, forKey: .maximum_towing)
        standard_payload = try values.decodeIfPresent(String.self, forKey: .standard_payload)
        maximum_payload = try values.decodeIfPresent(String.self, forKey: .maximum_payload)
        maximum_gvwr = try values.decodeIfPresent(String.self, forKey: .maximum_gvwr)
    }

}

struct Colors : Codable {
    let category : String?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case category = "category"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}

struct Equipment : Codable {
    let fourwd_awd : String?
    let abs_brakes : String?
    let adjustable_foot_pedals : String?
    let air_conditioning : String?
    let alloy_wheels : String?
    let am_fm_radio : String?
    let automatic_headlights : String?
    let automatic_load_leveling : String?
    let cargo_area_cover : String?
    let cargo_area_tiedowns : String?
    let cargo_net : String?
    let cassette_player : String?
    let cd_changer : String?
    let cd_player : String?
    let child_safety_door_locks : String?
    let chrome_wheels : String?
    let cruise_control : String?
    let daytime_running_lights : String?
    let deep_tinted_glass : String?
    let driver_airbag : String?
    let driver_multi_adjustable_power_seat : String?
    let dvd_player : String?
    let electrochromic_exterior_rearview_mirror : String?
    let electrochromic_interior_rearview_mirror : String?
    let electronic_brake_assistance : String?
    let electronic_parking_aid : String?
    let first_aid_kit : String?
    let fog_lights : String?
    let front_air_dam : String?
    let front_cooled_seat : String?
    let front_heated_seat : String?
    let front_power_lumbar_support : String?
    let front_power_memory_seat : String?
    let front_side_airbag : String?
    let front_side_airbag_with_head_protection : String?
    let front_split_bench_seat : String?
    let full_size_spare_tire : String?
    let genuine_wood_trim : String?
    let glass_rear_window_on_convertible : String?
    let heated_exterior_mirror : String?
    let heated_steering_wheel : String?
    let high_intensity_discharge_headlights : String?
    let interval_wipers : String?
    let keyless_entry : String?
    let leather_seat : String?
    let leather_steering_wheel : String?
    let limited_slip_differential : String?
    let load_bearing_exterior_rack : String?
    let locking_differential : String?
    let locking_pickup_truck_tailgate : String?
    let manual_sunroof : String?
    let navigation_aid : String?
    let passenger_airbag : String?
    let passenger_multi_adjustable_power_seat : String?
    let pickup_truck_bed_liner : String?
    let pickup_truck_cargo_box_light : String?
    let power_adjustable_exterior_mirror : String?
    let power_door_locks : String?
    let power_sliding_side_van_door : String?
    let power_sunroof : String?
    let power_trunk_lid : String?
    let power_windows : String?
    let rain_sensing_wipers : String?
    let rear_spoiler : String?
    let rear_window_defogger : String?
    let rear_wiper : String?
    let remote_ignition : String?
    let removable_top : String?
    let run_flat_tires : String?
    let running_boards : String?
    let second_row_folding_seat : String?
    let second_row_heated_seat : String?
    let second_row_multi_adjustable_power_seat : String?
    let second_row_removable_seat : String?
    let second_row_side_airbag : String?
    let second_row_side_airbag_with_head_protection : String?
    let second_row_sound_controls : String?
    let separate_driver_front_passenger_climate_controls : String?
    let side_head_curtain_airbag : String?
    let skid_plate : String?
    let sliding_rear_pickup_truck_window : String?
    let splash_guards : String?
    let steel_wheels : String?
    let steering_wheel_mounted_controls : String?
    let subwoofer : String?
    let tachometer : String?
    let telematics_system : String?
    let telescopic_steering_column : String?
    let third_row_removable_seat : String?
    let tilt_steering : String?
    let tilt_steering_column : String?
    let tire_pressure_monitor : String?
    let tow_hitch_receiver : String?
    let towing_preparation_package : String?
    let traction_control : String?
    let trip_computer : String?
    let trunk_anti_trap_device : String?
    let vehicle_anti_theft : String?
    let vehicle_stability_control_system : String?
    let voice_activated_telephone : String?
    let wind_deflector_for_convertibles : String?

    enum CodingKeys: String, CodingKey {

        case fourwd_awd = "4wd_awd"
        case abs_brakes = "abs_brakes"
        case adjustable_foot_pedals = "adjustable_foot_pedals"
        case air_conditioning = "air_conditioning"
        case alloy_wheels = "alloy_wheels"
        case am_fm_radio = "am_fm_radio"
        case automatic_headlights = "automatic_headlights"
        case automatic_load_leveling = "automatic_load_leveling"
        case cargo_area_cover = "cargo_area_cover"
        case cargo_area_tiedowns = "cargo_area_tiedowns"
        case cargo_net = "cargo_net"
        case cassette_player = "cassette_player"
        case cd_changer = "cd_changer"
        case cd_player = "cd_player"
        case child_safety_door_locks = "child_safety_door_locks"
        case chrome_wheels = "chrome_wheels"
        case cruise_control = "cruise_control"
        case daytime_running_lights = "daytime_running_lights"
        case deep_tinted_glass = "deep_tinted_glass"
        case driver_airbag = "driver_airbag"
        case driver_multi_adjustable_power_seat = "driver_multi_adjustable_power_seat"
        case dvd_player = "dvd_player"
        case electrochromic_exterior_rearview_mirror = "electrochromic_exterior_rearview_mirror"
        case electrochromic_interior_rearview_mirror = "electrochromic_interior_rearview_mirror"
        case electronic_brake_assistance = "electronic_brake_assistance"
        case electronic_parking_aid = "electronic_parking_aid"
        case first_aid_kit = "first_aid_kit"
        case fog_lights = "fog_lights"
        case front_air_dam = "front_air_dam"
        case front_cooled_seat = "front_cooled_seat"
        case front_heated_seat = "front_heated_seat"
        case front_power_lumbar_support = "front_power_lumbar_support"
        case front_power_memory_seat = "front_power_memory_seat"
        case front_side_airbag = "front_side_airbag"
        case front_side_airbag_with_head_protection = "front_side_airbag_with_head_protection"
        case front_split_bench_seat = "front_split_bench_seat"
        case full_size_spare_tire = "full_size_spare_tire"
        case genuine_wood_trim = "genuine_wood_trim"
        case glass_rear_window_on_convertible = "glass_rear_window_on_convertible"
        case heated_exterior_mirror = "heated_exterior_mirror"
        case heated_steering_wheel = "heated_steering_wheel"
        case high_intensity_discharge_headlights = "high_intensity_discharge_headlights"
        case interval_wipers = "interval_wipers"
        case keyless_entry = "keyless_entry"
        case leather_seat = "leather_seat"
        case leather_steering_wheel = "leather_steering_wheel"
        case limited_slip_differential = "limited_slip_differential"
        case load_bearing_exterior_rack = "load_bearing_exterior_rack"
        case locking_differential = "locking_differential"
        case locking_pickup_truck_tailgate = "locking_pickup_truck_tailgate"
        case manual_sunroof = "manual_sunroof"
        case navigation_aid = "navigation_aid"
        case passenger_airbag = "passenger_airbag"
        case passenger_multi_adjustable_power_seat = "passenger_multi_adjustable_power_seat"
        case pickup_truck_bed_liner = "pickup_truck_bed_liner"
        case pickup_truck_cargo_box_light = "pickup_truck_cargo_box_light"
        case power_adjustable_exterior_mirror = "power_adjustable_exterior_mirror"
        case power_door_locks = "power_door_locks"
        case power_sliding_side_van_door = "power_sliding_side_van_door"
        case power_sunroof = "power_sunroof"
        case power_trunk_lid = "power_trunk_lid"
        case power_windows = "power_windows"
        case rain_sensing_wipers = "rain_sensing_wipers"
        case rear_spoiler = "rear_spoiler"
        case rear_window_defogger = "rear_window_defogger"
        case rear_wiper = "rear_wiper"
        case remote_ignition = "remote_ignition"
        case removable_top = "removable_top"
        case run_flat_tires = "run_flat_tires"
        case running_boards = "running_boards"
        case second_row_folding_seat = "second_row_folding_seat"
        case second_row_heated_seat = "second_row_heated_seat"
        case second_row_multi_adjustable_power_seat = "second_row_multi_adjustable_power_seat"
        case second_row_removable_seat = "second_row_removable_seat"
        case second_row_side_airbag = "second_row_side_airbag"
        case second_row_side_airbag_with_head_protection = "second_row_side_airbag_with_head_protection"
        case second_row_sound_controls = "second_row_sound_controls"
        case separate_driver_front_passenger_climate_controls = "separate_driver_front_passenger_climate_controls"
        case side_head_curtain_airbag = "side_head_curtain_airbag"
        case skid_plate = "skid_plate"
        case sliding_rear_pickup_truck_window = "sliding_rear_pickup_truck_window"
        case splash_guards = "splash_guards"
        case steel_wheels = "steel_wheels"
        case steering_wheel_mounted_controls = "steering_wheel_mounted_controls"
        case subwoofer = "subwoofer"
        case tachometer = "tachometer"
        case telematics_system = "telematics_system"
        case telescopic_steering_column = "telescopic_steering_column"
        case third_row_removable_seat = "third_row_removable_seat"
        case tilt_steering = "tilt_steering"
        case tilt_steering_column = "tilt_steering_column"
        case tire_pressure_monitor = "tire_pressure_monitor"
        case tow_hitch_receiver = "tow_hitch_receiver"
        case towing_preparation_package = "towing_preparation_package"
        case traction_control = "traction_control"
        case trip_computer = "trip_computer"
        case trunk_anti_trap_device = "trunk_anti_trap_device"
        case vehicle_anti_theft = "vehicle_anti_theft"
        case vehicle_stability_control_system = "vehicle_stability_control_system"
        case voice_activated_telephone = "voice_activated_telephone"
        case wind_deflector_for_convertibles = "wind_deflector_for_convertibles"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        fourwd_awd = try values.decodeIfPresent(String.self, forKey: .fourwd_awd)
        abs_brakes = try values.decodeIfPresent(String.self, forKey: .abs_brakes)
        adjustable_foot_pedals = try values.decodeIfPresent(String.self, forKey: .adjustable_foot_pedals)
        air_conditioning = try values.decodeIfPresent(String.self, forKey: .air_conditioning)
        alloy_wheels = try values.decodeIfPresent(String.self, forKey: .alloy_wheels)
        am_fm_radio = try values.decodeIfPresent(String.self, forKey: .am_fm_radio)
        automatic_headlights = try values.decodeIfPresent(String.self, forKey: .automatic_headlights)
        automatic_load_leveling = try values.decodeIfPresent(String.self, forKey: .automatic_load_leveling)
        cargo_area_cover = try values.decodeIfPresent(String.self, forKey: .cargo_area_cover)
        cargo_area_tiedowns = try values.decodeIfPresent(String.self, forKey: .cargo_area_tiedowns)
        cargo_net = try values.decodeIfPresent(String.self, forKey: .cargo_net)
        cassette_player = try values.decodeIfPresent(String.self, forKey: .cassette_player)
        cd_changer = try values.decodeIfPresent(String.self, forKey: .cd_changer)
        cd_player = try values.decodeIfPresent(String.self, forKey: .cd_player)
        child_safety_door_locks = try values.decodeIfPresent(String.self, forKey: .child_safety_door_locks)
        chrome_wheels = try values.decodeIfPresent(String.self, forKey: .chrome_wheels)
        cruise_control = try values.decodeIfPresent(String.self, forKey: .cruise_control)
        daytime_running_lights = try values.decodeIfPresent(String.self, forKey: .daytime_running_lights)
        deep_tinted_glass = try values.decodeIfPresent(String.self, forKey: .deep_tinted_glass)
        driver_airbag = try values.decodeIfPresent(String.self, forKey: .driver_airbag)
        driver_multi_adjustable_power_seat = try values.decodeIfPresent(String.self, forKey: .driver_multi_adjustable_power_seat)
        dvd_player = try values.decodeIfPresent(String.self, forKey: .dvd_player)
        electrochromic_exterior_rearview_mirror = try values.decodeIfPresent(String.self, forKey: .electrochromic_exterior_rearview_mirror)
        electrochromic_interior_rearview_mirror = try values.decodeIfPresent(String.self, forKey: .electrochromic_interior_rearview_mirror)
        electronic_brake_assistance = try values.decodeIfPresent(String.self, forKey: .electronic_brake_assistance)
        electronic_parking_aid = try values.decodeIfPresent(String.self, forKey: .electronic_parking_aid)
        first_aid_kit = try values.decodeIfPresent(String.self, forKey: .first_aid_kit)
        fog_lights = try values.decodeIfPresent(String.self, forKey: .fog_lights)
        front_air_dam = try values.decodeIfPresent(String.self, forKey: .front_air_dam)
        front_cooled_seat = try values.decodeIfPresent(String.self, forKey: .front_cooled_seat)
        front_heated_seat = try values.decodeIfPresent(String.self, forKey: .front_heated_seat)
        front_power_lumbar_support = try values.decodeIfPresent(String.self, forKey: .front_power_lumbar_support)
        front_power_memory_seat = try values.decodeIfPresent(String.self, forKey: .front_power_memory_seat)
        front_side_airbag = try values.decodeIfPresent(String.self, forKey: .front_side_airbag)
        front_side_airbag_with_head_protection = try values.decodeIfPresent(String.self, forKey: .front_side_airbag_with_head_protection)
        front_split_bench_seat = try values.decodeIfPresent(String.self, forKey: .front_split_bench_seat)
        full_size_spare_tire = try values.decodeIfPresent(String.self, forKey: .full_size_spare_tire)
        genuine_wood_trim = try values.decodeIfPresent(String.self, forKey: .genuine_wood_trim)
        glass_rear_window_on_convertible = try values.decodeIfPresent(String.self, forKey: .glass_rear_window_on_convertible)
        heated_exterior_mirror = try values.decodeIfPresent(String.self, forKey: .heated_exterior_mirror)
        heated_steering_wheel = try values.decodeIfPresent(String.self, forKey: .heated_steering_wheel)
        high_intensity_discharge_headlights = try values.decodeIfPresent(String.self, forKey: .high_intensity_discharge_headlights)
        interval_wipers = try values.decodeIfPresent(String.self, forKey: .interval_wipers)
        keyless_entry = try values.decodeIfPresent(String.self, forKey: .keyless_entry)
        leather_seat = try values.decodeIfPresent(String.self, forKey: .leather_seat)
        leather_steering_wheel = try values.decodeIfPresent(String.self, forKey: .leather_steering_wheel)
        limited_slip_differential = try values.decodeIfPresent(String.self, forKey: .limited_slip_differential)
        load_bearing_exterior_rack = try values.decodeIfPresent(String.self, forKey: .load_bearing_exterior_rack)
        locking_differential = try values.decodeIfPresent(String.self, forKey: .locking_differential)
        locking_pickup_truck_tailgate = try values.decodeIfPresent(String.self, forKey: .locking_pickup_truck_tailgate)
        manual_sunroof = try values.decodeIfPresent(String.self, forKey: .manual_sunroof)
        navigation_aid = try values.decodeIfPresent(String.self, forKey: .navigation_aid)
        passenger_airbag = try values.decodeIfPresent(String.self, forKey: .passenger_airbag)
        passenger_multi_adjustable_power_seat = try values.decodeIfPresent(String.self, forKey: .passenger_multi_adjustable_power_seat)
        pickup_truck_bed_liner = try values.decodeIfPresent(String.self, forKey: .pickup_truck_bed_liner)
        pickup_truck_cargo_box_light = try values.decodeIfPresent(String.self, forKey: .pickup_truck_cargo_box_light)
        power_adjustable_exterior_mirror = try values.decodeIfPresent(String.self, forKey: .power_adjustable_exterior_mirror)
        power_door_locks = try values.decodeIfPresent(String.self, forKey: .power_door_locks)
        power_sliding_side_van_door = try values.decodeIfPresent(String.self, forKey: .power_sliding_side_van_door)
        power_sunroof = try values.decodeIfPresent(String.self, forKey: .power_sunroof)
        power_trunk_lid = try values.decodeIfPresent(String.self, forKey: .power_trunk_lid)
        power_windows = try values.decodeIfPresent(String.self, forKey: .power_windows)
        rain_sensing_wipers = try values.decodeIfPresent(String.self, forKey: .rain_sensing_wipers)
        rear_spoiler = try values.decodeIfPresent(String.self, forKey: .rear_spoiler)
        rear_window_defogger = try values.decodeIfPresent(String.self, forKey: .rear_window_defogger)
        rear_wiper = try values.decodeIfPresent(String.self, forKey: .rear_wiper)
        remote_ignition = try values.decodeIfPresent(String.self, forKey: .remote_ignition)
        removable_top = try values.decodeIfPresent(String.self, forKey: .removable_top)
        run_flat_tires = try values.decodeIfPresent(String.self, forKey: .run_flat_tires)
        running_boards = try values.decodeIfPresent(String.self, forKey: .running_boards)
        second_row_folding_seat = try values.decodeIfPresent(String.self, forKey: .second_row_folding_seat)
        second_row_heated_seat = try values.decodeIfPresent(String.self, forKey: .second_row_heated_seat)
        second_row_multi_adjustable_power_seat = try values.decodeIfPresent(String.self, forKey: .second_row_multi_adjustable_power_seat)
        second_row_removable_seat = try values.decodeIfPresent(String.self, forKey: .second_row_removable_seat)
        second_row_side_airbag = try values.decodeIfPresent(String.self, forKey: .second_row_side_airbag)
        second_row_side_airbag_with_head_protection = try values.decodeIfPresent(String.self, forKey: .second_row_side_airbag_with_head_protection)
        second_row_sound_controls = try values.decodeIfPresent(String.self, forKey: .second_row_sound_controls)
        separate_driver_front_passenger_climate_controls = try values.decodeIfPresent(String.self, forKey: .separate_driver_front_passenger_climate_controls)
        side_head_curtain_airbag = try values.decodeIfPresent(String.self, forKey: .side_head_curtain_airbag)
        skid_plate = try values.decodeIfPresent(String.self, forKey: .skid_plate)
        sliding_rear_pickup_truck_window = try values.decodeIfPresent(String.self, forKey: .sliding_rear_pickup_truck_window)
        splash_guards = try values.decodeIfPresent(String.self, forKey: .splash_guards)
        steel_wheels = try values.decodeIfPresent(String.self, forKey: .steel_wheels)
        steering_wheel_mounted_controls = try values.decodeIfPresent(String.self, forKey: .steering_wheel_mounted_controls)
        subwoofer = try values.decodeIfPresent(String.self, forKey: .subwoofer)
        tachometer = try values.decodeIfPresent(String.self, forKey: .tachometer)
        telematics_system = try values.decodeIfPresent(String.self, forKey: .telematics_system)
        telescopic_steering_column = try values.decodeIfPresent(String.self, forKey: .telescopic_steering_column)
        third_row_removable_seat = try values.decodeIfPresent(String.self, forKey: .third_row_removable_seat)
        tilt_steering = try values.decodeIfPresent(String.self, forKey: .tilt_steering)
        tilt_steering_column = try values.decodeIfPresent(String.self, forKey: .tilt_steering_column)
        tire_pressure_monitor = try values.decodeIfPresent(String.self, forKey: .tire_pressure_monitor)
        tow_hitch_receiver = try values.decodeIfPresent(String.self, forKey: .tow_hitch_receiver)
        towing_preparation_package = try values.decodeIfPresent(String.self, forKey: .towing_preparation_package)
        traction_control = try values.decodeIfPresent(String.self, forKey: .traction_control)
        trip_computer = try values.decodeIfPresent(String.self, forKey: .trip_computer)
        trunk_anti_trap_device = try values.decodeIfPresent(String.self, forKey: .trunk_anti_trap_device)
        vehicle_anti_theft = try values.decodeIfPresent(String.self, forKey: .vehicle_anti_theft)
        vehicle_stability_control_system = try values.decodeIfPresent(String.self, forKey: .vehicle_stability_control_system)
        voice_activated_telephone = try values.decodeIfPresent(String.self, forKey: .voice_activated_telephone)
        wind_deflector_for_convertibles = try values.decodeIfPresent(String.self, forKey: .wind_deflector_for_convertibles)
    }

}

struct Input : Codable {
    let key : String?
    let vin : String?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case vin = "vin"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = try values.decodeIfPresent(String.self, forKey: .key)
        vin = try values.decodeIfPresent(String.self, forKey: .vin)
    }

}

struct Warranties : Codable {
    let type : String?
    let miles : String?
    let months : String?

    enum CodingKeys: String, CodingKey {

        case type = "type"
        case miles = "miles"
        case months = "months"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        miles = try values.decodeIfPresent(String.self, forKey: .miles)
        months = try values.decodeIfPresent(String.self, forKey: .months)
    }

}


