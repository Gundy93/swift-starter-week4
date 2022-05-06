import Foundation

struct Person {
    let name: String
    var bodyCondition: BodyCondition
    
    mutating func exercise(for set: Int, _ routine: Routine) {
        print("\(routine.name)을 \(set)set 시작합니다.")
        for _ in 1...set {
            routine.doExercises(&bodyCondition)
        }
    }
}

struct FitnessCenter {
    let centerName: String
    var bodyGoal: BodyCondition
    var member: Person?
    let routineList: [Routine]
    
    mutating func trainMember() {
    }
}

struct BodyCondition {
    var upperBodyStrength: Int
    var lowerBodyStrength: Int
    var muscularEndurance: Int
    var fatigue: Int
    
    mutating func changeUpperBodyStrength(by number: Int) {
        self.upperBodyStrength += number
    }
    
    mutating func changeLowerBodyStrength(by number: Int) {
        self.lowerBodyStrength += number
    }
    
    mutating func changeMuscularEndurance(by number: Int) {
        self.muscularEndurance += number
    }
    
    mutating func changeFatigue(by number: Int) {
        self.fatigue += number
    }
    
    func printBodyCondition() {
        print("""
            현재의 컨디션은 다음과 같습니다.
            상체근력 : \(self.upperBodyStrength)
            하체근력 : \(self.lowerBodyStrength)
            근지구력 : \(self.muscularEndurance)
            피로도 : \(self.fatigue)
            """)
    }
}

struct Exercise {
    let name: String
    let action: (inout BodyCondition) -> Void
}

struct Routine {
    let name: String
    let exercises: [Exercise]
    
    func doExercises(_ bodyCondition: inout BodyCondition) {
        print("-------------------------")
        print("\(name)을 시작합니다.")

        for exercise in exercises {
            print("\(exercise.name)")
            exercise.action(&bodyCondition)
        }
        print("-------------------------")
    }
}

let sitUp: Exercise = Exercise(name: "윗몸일으키기") {
    $0.changeUpperBodyStrength(by: Int.random(in: 10...20))
    $0.changeFatigue(by: Int.random(in: 10...20))
}

let squad: Exercise = Exercise(name: "스쿼드") {
    $0.changeLowerBodyStrength(by: Int.random(in: 20...30))
    $0.changeFatigue(by: Int.random(in: 10...20))
}

let longDistanceRunning: Exercise = Exercise(name: "오래달리기") {
    $0.changeMuscularEndurance(by: Int.random(in: 20...30))
    $0.changeUpperBodyStrength(by: Int.random(in: 5...10))
    $0.changeLowerBodyStrength(by: Int.random(in: 5...10))
    $0.changeFatigue(by: Int.random(in: 20...30))
}

let activeRest: Exercise = Exercise(name: "동적휴식") {
    $0.changeFatigue(by: Int.random(in: -10 ... -5))
}

let legRaise: Exercise = Exercise(name: "레그레이즈") {
    $0.changeUpperBodyStrength(by: Int.random(in: 20...30))
    $0.changeLowerBodyStrength(by: Int.random(in: 20...30))
    $0.changeFatigue(by: Int.random(in: 10...20))
}

let burpee: Exercise = Exercise(name: "버피테스트") {
    $0.changeMuscularEndurance(by: Int.random(in: 20...30))
    $0.changeUpperBodyStrength(by: Int.random(in: 5...10))
    $0.changeLowerBodyStrength(by: Int.random(in: 5...10))
    $0.changeFatigue(by: Int.random(in: 20...30))
}

// step1 실행코드
/*
var myCondition = BodyCondition(upperBodyStrength: 0, lowerBodyStrength: 0, muscularEndurance: 0, fatigue: 0)
let myExercises: [Exercise] = [sitUp, sitUp, activeRest, squad, squad, activeRest, longDistanceRunning, longDistanceRunning]
let myRoutine = Routine(name: "hellRoutine", exercises: myExercises)
myRoutine.doExercises(&myCondition)
myCondition.printBodyCondition()
*/
